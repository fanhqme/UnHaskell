module UEnvironment where

import System.IO
import System.Environment
import Data.Char
import System.Process
import System.Exit
import Control.Monad.Trans.Class

class UEnv e where
	-- eExit :: Int -> e ()
	-- eException :: [Char] -> e ()
	-- eReturnResult :: [Char] -> e ()
	eOpen :: [Int] -> Int -> e Int
	eClose :: Int -> e Int
	eGetChar :: Int -> e Int
	ePeekChar :: Int -> e Int
	ePutChar :: Int -> Int -> e Int
	eGetArg :: e Int
	eSystem :: [Int] -> e Int

data UEvalResult r a = URunning a | UExited Int | UExceptionHappened [Char] | UResultReturned r
newtype UEvalEnv r e a = UEvalEnv {runUEvalEnv :: e (UEvalResult r a)}

instance (Monad e) => Monad (UEvalEnv r e) where
	(UEvalEnv f) >>= g = UEvalEnv (f >>= (\ret -> case (ret) of
		URunning a -> runUEvalEnv (g a)
		UExited a -> return$UExited a
		UExceptionHappened a -> return$UExceptionHappened a
		UResultReturned a -> return$UResultReturned a
		))
	return a = UEvalEnv (return (URunning a))
instance MonadTrans (UEvalEnv r) where
-- f :: e a
-- need: UEvalEnv r e a
	lift f = UEvalEnv (f >>= (\a -> return$URunning a))

eExit :: (Monad e) => Int -> UEvalEnv r e ()
eExit a = UEvalEnv (return (UExited a))
eException :: (Monad e) => [Char] -> UEvalEnv r e ()
eException a = UEvalEnv (return (UExceptionHappened a))
eReturnResult :: (Monad e) => r -> UEvalEnv r e ()
eReturnResult a = UEvalEnv (return (UResultReturned a))

efOpenModes = [ReadMode,WriteMode,AppendMode,ReadWriteMode]

data UFileList h = UFileList [Maybe h] [Int] deriving Show

flAddHandle :: h -> UFileList h -> (Int,UFileList h)
flAddHandle h (UFileList hdls args) = findEmptySlot hdls id 0 where
	findEmptySlot [] prefix curno = (curno,UFileList (prefix [Just h]) args)
	findEmptySlot (Nothing:r) prefix curno = (curno,UFileList (prefix ((Just h):r)) args)
	findEmptySlot (a:r) prefix curno = findEmptySlot r (\x -> prefix (a:x)) (curno+1)

flGetHandle :: Int -> UFileList h -> Maybe h
flGetHandle fno (UFileList hdls args)
	| fno>=0 && fno<length hdls = hdls!!fno
	| otherwise = Nothing
flCloseHandle :: Int -> UFileList h -> UFileList h
flCloseHandle fno (UFileList hdls args)
	| fno>=0 && fno<length hdls = UFileList ((take fno hdls)++(Nothing:(drop (fno+1) hdls))) args
	| otherwise = UFileList hdls args
flGetArg :: UFileList h -> (Int,UFileList h)
flGetArg (UFileList hdls []) = ((-1),UFileList hdls [])
flGetArg (UFileList hdls (a:ar)) = (a,UFileList hdls ar)


newtype URealWorldEnv a = URealWorldEnv {runRealWorldEnv :: UFileList Handle ->IO (a,UFileList Handle)}

liftUR :: IO a -> URealWorldEnv a
liftUR b = URealWorldEnv (\f -> (b>>=(\a -> return (a,f))))

instance Monad URealWorldEnv where
	(URealWorldEnv f) >>= g = URealWorldEnv (\initfiles -> 
			((f initfiles) >>= (\(va,files1) -> runRealWorldEnv (g va) files1)))
	f >> g = (f >>= (const g))
	return a = URealWorldEnv (\f -> return (a,f))

isValidCharInt :: Int -> Bool
isValidCharInt a = (a>=0 && a<1114112)

instance UEnv URealWorldEnv where
	eOpen filename mode = URealWorldEnv (\initfiles ->
		if (mode<0 || mode>=length efOpenModes) then
			return ((-2),initfiles)
		else if (any (not.isValidCharInt) filename) then
			return ((-3),initfiles)
		else
			(openBinaryFile (map chr filename) (efOpenModes!!mode) >>=
				(\handle -> ( let (fno,files1) = flAddHandle handle initfiles in
					return (fno,files1)
				)))
		)
	eClose fno = URealWorldEnv (\initfiles ->
		case (flGetHandle fno initfiles) of
			Nothing -> return ((-2),initfiles)
			Just hdl -> ( hClose hdl >> (
				return (0,(flCloseHandle fno initfiles))
				))
		)
	eGetChar fno = URealWorldEnv (\initfiles ->
		case (flGetHandle fno initfiles) of
			Nothing -> return ((-2),initfiles)
			Just hdl -> (hIsEOF hdl) >>= (\iseof -> case iseof of
				False -> hGetChar hdl >>= (\c ->return ((ord c),initfiles))
				True -> return ((-1),initfiles)
				)
		)
	ePeekChar fno = URealWorldEnv (\initfiles ->
		case (flGetHandle fno initfiles) of
			Nothing -> return ((-2),initfiles)
			Just hdl -> (hIsEOF hdl) >>= (\iseof -> case iseof of
				False -> hLookAhead hdl >>= (\c -> return ((ord c),initfiles))
				True -> return ((-1),initfiles)
				)
		)
	ePutChar fno content = URealWorldEnv (\initfiles ->
		if isValidCharInt content then
			case (flGetHandle fno initfiles) of
				Nothing -> return ((-2),initfiles)
				Just hdl -> ( hPutChar hdl (chr content) >> (
					return ((0),initfiles)
					))
		else
			return ((-3),initfiles)
		)
	eGetArg = URealWorldEnv (\initfiles ->
		let (ret,files1)=flGetArg initfiles in
		return (ret,files1)
		)
	eSystem cmd_int = URealWorldEnv (\initfiles -> do
		if (all isValidCharInt cmd_int) then do
			let cmd = map chr cmd_int
			exit_code <- system cmd
			case exit_code of
				ExitSuccess -> return (0,initfiles)
				ExitFailure a -> return (a,initfiles)
		else
			return ((-3),initfiles)
		)
			

initRealWorldEnv :: [[Char]] -> URealWorldEnv ()
initRealWorldEnv args = URealWorldEnv (\oldstate -> 
		let iargs = listjoin 0 (map (map ord) args) in
			return ((),UFileList [Just stdin,Just stdout] iargs)) where
	listjoin s [] = []
	listjoin s (a:[]) = a
	listjoin s (a:ar) = a++(s:(listjoin s ar))

runRealWorld :: [[Char]] -> URealWorldEnv a -> IO a
runRealWorld args f = (runRealWorldEnv (initRealWorldEnv args>>f)) (UFileList [] []) >>= (return.fst)

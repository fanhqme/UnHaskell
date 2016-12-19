module UEnvironment where

import System.IO
import System.Environment
import Data.Char
import qualified Data.Map as Map

class UEnv e where
	eExit :: Int -> e ()
	eException :: [Char] -> e ()
	eReturnResult :: [Char] -> e ()
	eOpen :: [Int] -> Int -> e Int
	eClose :: Int -> e Int
	eGetChar :: Int -> e Int
	ePeekChar :: Int -> e Int
	ePutChar :: Int -> Int -> e Int
	eGetArg :: e Int

efOpenModes = [ReadMode,WriteMode,AppendMode,ReadWriteMode]
-- currently, only r and w are supported

data UFinishState a = URunning a | UFinished Int | UExceptionHappened [Char] | UResultReturned [Char] deriving Show
data UFileList h = UFileList {flFiles::[Maybe h],flArgToRead::[Int]} deriving Show

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


newtype URealWorldEnv a = URealWorldEnv {runRealWorldEnv :: UFileList Handle ->IO (UFinishState a,UFileList Handle)}

instance Monad URealWorldEnv where
	-- f ::  UFileList -> IO (UFinishState a,UFileList)
	-- g :: a -> URealWorldEnv (UFileList -> IO (UFinishState b,UFileList))
	(URealWorldEnv f) >>= g = URealWorldEnv (\initfiles -> 
			(f initfiles) >>= (\(finishstate1,files1) ->
				case finishstate1 of
					UFinished r -> return (UFinished r ,files1)
					UExceptionHappened e -> return (UExceptionHappened e,files1)
					UResultReturned e -> return (UResultReturned e,files1)
					URunning va -> runRealWorldEnv (g va) files1
			)
		)
	f >> g = (f >>= (const g))
	return a = URealWorldEnv (\f -> return (URunning a,f))

isValidCharInt :: Int -> Bool
isValidCharInt a = (a>=0 && a<1114112)

instance UEnv URealWorldEnv where
	eExit retval = URealWorldEnv (\initfiles ->
		return (UFinished retval,initfiles))
	eException msg = URealWorldEnv (\initfiles ->
		return (UExceptionHappened msg,initfiles))
	eReturnResult msg = URealWorldEnv (\initfiles ->
		return (UResultReturned msg,initfiles))
	eOpen filename mode = URealWorldEnv (\initfiles ->
		if (mode>=0 && mode<=length efOpenModes) then
			return (URunning (-2),initfiles)
		else if (any (not.isValidCharInt) filename) then
			return (URunning (-3),initfiles)
		else
			(openFile (map chr filename) (efOpenModes!!mode) >>=
				(\handle -> ( let (fno,files1) = flAddHandle handle initfiles in
					return (URunning fno,files1)
				)))
		)
	eClose fno = URealWorldEnv (\initfiles ->
		case (flGetHandle fno initfiles) of
			Nothing -> return (URunning (-2),initfiles)
			Just hdl -> ( hClose hdl >> (
				return (URunning 0,(flCloseHandle fno initfiles))
				))
		)
	eGetChar fno = URealWorldEnv (\initfiles ->
		case (flGetHandle fno initfiles) of
			Nothing -> return (URunning (-2),initfiles)
			Just hdl -> (hIsEOF hdl) >>= (\iseof -> case iseof of
				False -> hGetChar hdl >>= (\c ->return (URunning (ord c),initfiles))
				True -> return (URunning (-1),initfiles)
				)
		)
	ePeekChar fno = URealWorldEnv (\initfiles ->
		case (flGetHandle fno initfiles) of
			Nothing -> return (URunning (-2),initfiles)
			Just hdl -> (hIsEOF hdl) >>= (\iseof -> case iseof of
				False -> hLookAhead hdl >>= (\c -> return (URunning (ord c),initfiles))
				True -> return (URunning (-1),initfiles)
				)
		)
	ePutChar fno content = URealWorldEnv (\initfiles ->
		if isValidCharInt content then
			case (flGetHandle fno initfiles) of
				Nothing -> return (URunning (-2),initfiles)
				Just hdl -> ( hPutChar hdl (chr content) >> (
					return (URunning (0),initfiles)
					))
		else
			return (URunning (-3),initfiles)
		)
	eGetArg = URealWorldEnv (\initfiles ->
		let (ret,files1)=flGetArg initfiles in
		return (URunning ret,files1)
		)

initRealWorldEnv = URealWorldEnv (\oldstate -> 
	getArgs >>= (\args ->
		let iargs = listjoin (-1) (map (map ord) args) in
			return (URunning (),UFileList [Just stdin,Just stdout] iargs))) where
	listjoin s [] = []
	listjoin s (a:[]) = a
	listjoin s (a:ar) = a++(s:(listjoin s ar))
runRealWorld a = (runRealWorldEnv (initRealWorldEnv >> a) (UFileList [] [])) >>= (\(exitstate,_) ->
		case exitstate of
			UFinished 0 -> return ()
			UFinished a -> putStrLn ("exit with code "++show a)
			UExceptionHappened e -> putStrLn ("Exception: " ++ e)
			UResultReturned e -> putStrLn e
			URunning _ -> putStrLn "execution interupted"
	)

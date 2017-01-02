import System.Environment
import System.IO
import UModuleLoader
import UParse
import UEnvironment
import URunTime
import ULambdaExpression
import qualified Data.Set as Set

main = do
	args <- getArgs
	case args of
		"-i":ifname:[] -> do
			writeEvalResult ifname stdout args
		"-i":ifname:"-o":ofname:[] -> do
			fout <- openFile ofname WriteMode
			writeEvalResult ifname fout args
			hClose fout
		"-t":ifname:[] -> do
			fin <- openFile ifname ReadMode
			writeParseResult fin stdout
		"-t":ifname:"-o":ofname:[] -> do
			fin <- openFile ifname ReadMode
			fout <- openFile ofname WriteMode
			writeParseResult fin fout
			hClose fout
		_ -> putStrLn "ki -i <file> [-o <file>]\nki -t <file> [-o <file>]"
		where
			writeEvalResult ifname fout args = do
				loadc <- loadMainModule ifname defaultLoadContext
				case loadc of
					MFail msg modname pos -> putStrLn ("error loading "++modname++" at "++(show pos)++": "++msg)
					MSucc (MLoadContext loaded curchain)
						| (not (Set.member "main.main" loaded)) -> putStrLn "main.main not defined"
						| otherwise -> do
							eval_result <- (runRealWorld (tail args)$runUEvalEnv$executeVExp$fromLExpr$assembleChainLExpr curchain (LRef "main.main"))
							case eval_result of
								URunning () -> putStrLn "execution interrupted"
								UExited x -> if (x==0) then return () else putStrLn ("exit with code "++(show x))
								UExceptionHappened f -> putStrLn ("exception: "++f)
								UResultReturned (v,_) -> hPutStrLn fout (showPrettyValue v)
			writeParseResult fin fout = do
				content <- hGetContents fin
				case parseSTokenTreeStr content of
					SFail msg position -> putStrLn ("parser error: "++msg++" at "++(show position))
					SSucc (st,_) -> hPutStr fout (show st)
			showPrettyValue v
				| isTrueValue v = "True"
				| isFalseValue v = "False"
				| otherwise = showValue v
			isTrueValue v = case v of
				VAbs name1 (VClean (VAbs name2 (VRef name3))) -> name1==name3
				_ -> False
			isFalseValue v = case v of
				VAbs name1 (VClean (VAbs name2 (VRef name3))) -> name2==name3
				_ -> False

import System.Environment
import qualified Data.Set as Set
import UModuleLoader
import URunTime
import UEnvironment
import ULambdaExpression

main = do
	args <- getArgs
	if (length args)/=1 then
		putStrLn "Usage: urun filename.u"
	else do
		let ifname = head args
		loadc <- loadMainModule ifname defaultLoadContext
		case loadc of
			MFail msg modname pos -> putStrLn ("error loading "++modname++" at "++(show pos)++": "++msg)
			MSucc (MLoadContext loaded curchain)
				| (not (Set.member "main.main" loaded)) -> putStrLn "main.main not defined"
				| otherwise -> do
					eval_result <- (runRealWorld$runUEvalEnv$executeVExp$fromLExpr$assembleChainLExpr curchain (LRef "main.main"))
					case eval_result of
						URunning () -> putStrLn "execution interrupted"
						UExited x -> if (x==0) then return () else putStrLn ("exit with code "++(show x))
						UExceptionHappened f -> putStrLn ("exception: "++f)
						UResultReturned (v,_) -> putStrLn (showValue v)

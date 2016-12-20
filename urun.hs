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
			MFail msg modname pos -> putStrLn ("error loading "++modname++" at "++(show pos)++" : "++msg)
			MSucc (MLoadContext loaded curchain)
				| (not (Set.member "main.main" loaded)) -> putStrLn "main.main not defined"
				| otherwise -> runRealWorld$executeVExp$fromLExpr$assembleChainLExpr curchain (LRef "main.main")

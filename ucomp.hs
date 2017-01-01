import System.Environment
import System.IO
import UModuleLoader
import ULambdaExpression
import UCompile
import qualified Data.Set as Set

main = do
	args <- getArgs
	if null args then
		putStrLn "ucomp: ifname.u"
	else do
		let ifname = head args
		loadc <- loadMainModule ifname defaultLoadContext
		case loadc of
			MFail msg modname pos -> putStrLn ("error loading "++modname++" at "++(show pos)++": "++msg)
			MSucc (MLoadContext loaded curchain)
				| (not (Set.member "main.main" loaded)) -> putStrLn "main.main not defined"
				| otherwise -> do
					fout <- openFile (ifname++"c") WriteMode
					hPutStrLn fout$compileToC$assembleChainLExpr curchain (LRef "main.main")
					hClose fout


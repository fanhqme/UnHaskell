import Data.List
import System.Environment
import System.IO
import System.Process
import UModuleLoader
import ULambdaExpression
import UCompile
import UOptimize
import qualified Data.Set as Set

main = do
	args <- getArgs
	case args of
		(ifname:"-o":ofname:[]) -> do
			if not$isSuffixOf ".u" ifname then do
				putStrLn "filename must end with .u"
			else do
				let basename = take (length ifname - 2) ifname
				loadc <- loadMainModule ifname defaultLoadContext
				case loadc of
					MFail msg modname pos -> putStrLn ("error loading "++modname++" at "++(show pos)++": "++msg)
					MSucc (MLoadContext loaded curchain)
						| (not (Set.member "main.main" loaded)) -> putStrLn "main.main not defined"
						| otherwise -> do
							let llname = (basename ++ ".ll")
							let sname = (basename ++ ".s")
							fout <- openFile llname WriteMode
							hPutStrLn fout$compileToLLVM$optchain
							hClose fout
							rawSystem "llc" [llname,"-o",sname,"-O2"]
							rawSystem "clang" ["simpleruntime.ll",sname,"-o",ofname,"-O2","-lm"]
							return ()
						where
							rawchain = assembleChainLExpr curchain (LRef "main.main")
							optchain = optimizeLExpr$rawchain
		_ -> putStrLn "kc ifname.u -o ofname"

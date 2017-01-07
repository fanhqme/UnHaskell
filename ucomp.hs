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
	if null args then
		putStrLn "ucomp: ifname.u"
	else do
		let ifname = head args
		let outputc = "-c" `elem` (tail args)
		if not$isSuffixOf ".u" ifname then do
			putStrLn "filename must end with .u"
		else do
			let basename = take (length ifname - 2) ifname
			loadc <- loadMainModule ifname defaultLoadContext
			case loadc of
				MFail msg modname pos -> putStrLn ("error loading "++modname++" at "++(show pos)++": "++msg)
				MSucc (MLoadContext loaded curchain)
					| (not (Set.member "main.main" loaded)) -> putStrLn "main.main not defined"
					| outputc -> do
						fout <- openFile (basename++".c") WriteMode
						hPutStrLn fout$compileToC$optchain
						hClose fout
					| otherwise -> do
						let llname = (basename ++ ".ll")
						let sname = (basename ++ ".s")
						let rtname = (basename ++ ".rt.s")
						fout <- openFile llname WriteMode
						hPutStrLn fout$compileToLLVM$optchain
						hClose fout
						rawSystem "llc" ["simpleruntime.ll","-o",rtname,"-O2"]
						rawSystem "llc" [llname,"-o",sname,"-O2"]
						rawSystem "clang" [rtname,sname,"-o",basename,"-O2","-lm"]
						return ()
					where
						rawchain = assembleChainLExpr curchain (LRef "main.main")
						optchain = optimizeLExpr$rawchain

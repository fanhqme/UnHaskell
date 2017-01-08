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
	let (ifname,ofname,outputc,target) = parseArg args ("","",False,"")
	if null ifname || (not$isSuffixOf ".u" ifname) then
		putStrLn "ucomp: ifname.u [-o ofname] [-c] [-is arch] "
	else do
		let basename = take (length ifname - 2) ifname
		runCompile basename ofname outputc target
	where
	parseArg args (ifname,ofname,outputc,target) = case args of
		[] -> (ifname,ofname,outputc,target)
		("-o":f:r) -> parseArg r (ifname,f,outputc,target)
		("-is":f:r) -> parseArg r (ifname,ofname,outputc,f)
		("-c":r) -> parseArg r (ifname,ofname,True,target)
		(f:r) -> parseArg r (f,ofname,outputc,target)

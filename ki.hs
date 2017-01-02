import System.Environment
import System.IO
import UModuleLoader
import UParse
import UEnvironment
import URunTime
import ULambdaExpression
import UInterpret
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
		"-repl":[] -> runInteractive [] False
		_ -> putStrLn "ki -i <file> [-o <file>]\nki -t <file> [-o <file>]\nki -repl"
		where
			writeEvalResult ifname fout args = do
				runFileF fout ifname args
			writeParseResult fin fout = do
				content <- hGetContents fin
				case parseSTokenTreeStr content of
					SFail msg position -> putStrLn ("parser error: "++msg++" at "++(show position))
					SSucc (st,_) -> hPutStr fout (show st)

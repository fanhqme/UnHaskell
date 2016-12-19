import System.IO

import UParse
import URunTime
import UEnvironment

executeLine line = do
	let parse_result = parseLExprStr line
	case parse_result of
		SFail message position -> putStrLn ("parser error: "++message++" at "++(show position))
		SSucc lexpr -> runRealWorld $ executeVExp $ fromLExpr lexpr

main = do
	putStrLn "; type :q to quit, :? for help"
	repl where
		repl = do
			putStr ">"
			hFlush stdout
			iseof <- hIsEOF stdin
			if iseof then putStrLn "" else do
				line <- getLine
				if line == ":q" then return () else do
					if line == ":?" then do
						putStrLn ":q   quit current session"
						putStrLn ":?   show this help message"
						putStrLn "expr compute expression"
					else
						executeLine line
					repl

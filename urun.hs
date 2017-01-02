import System.Environment
import UInterpret

main = do
	args <- getArgs
	if null args || ((head args) == "-") then
		runInteractive (drop 1 args) True
	else do
		runFile (head args) (tail args)

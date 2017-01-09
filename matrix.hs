import Data.List
import Data.List.Split
import System.IO
import System.Environment
import Data.Char  
  
readInt :: String -> Int
readInt = read

readMatrix :: String -> IO ([[Int]])
readMatrix filename = do  
        contents <- readFile filename
        let rows = lines contents
        let matrix = map (map readInt . splitOn " ") rows
        return matrix

multiplyMatrix :: [[Int]] -> [[Int]] -> [[Int]]
multiplyMatrix a b = [[sum $ zipWith (*) ar bc | bc <- bT] | ar <- a] where bT = transpose b

writeMatrix :: String -> [[Int]] -> IO ()
writeMatrix filename m = writeFile filename (concat $ intersperse "\n" $ map showRow m)
							where showRow r = concat $ intersperse " " $ map show r

main = do
	args <- getArgs
	let input1 = args !! 0
	let input2 = args !! 1
	let output = args !! 2
	a <- readMatrix input1
	b <- readMatrix input2
	let c = multiplyMatrix a b
	writeMatrix output c
	
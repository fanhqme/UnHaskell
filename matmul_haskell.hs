import Data.Char (ord,chr)

intFromDigit :: Char -> Int
intFromDigit x = (ord x - ord '0')

isDigit :: Char -> Bool
isDigit x = (x >= '0') && (x <= '9')

intFromDigits :: [Char] -> Int
intFromDigits = foldl (\t a -> t*10+intFromDigit a) 0

digitFromInt :: Int -> Char
digitFromInt = chr.(ord '0' +)

atof :: [Char] -> Double
atof = signedParse atofP where
	signedParse f s = case s of
		[] -> f s
		('+':r) -> f r
		('-':r) -> negate (f r)
		_ -> f s
	mantissa = foldr (\a t -> 0.1*(fromIntegral (intFromDigit a)+t)) 0.0
	atofP :: [Char] -> Double
	atofP s = let
		(ipart,fpart) = (span isDigit s)
		ival = (intFromDigits ipart)
		in case fpart of
			[] -> fromIntegral ival
			(h:r) -> case h /= '.' of
				True -> fromIntegral ival
				False -> fromIntegral ival + mantissa (takeWhile isDigit r)

uitoa :: Int -> [Char]
uitoa = uitoa' "" where
	uitoa' t x = if x<=9 then (digitFromInt x):t else uitoa' ((digitFromInt (x `mod` 10)):t) (x `div` 10)
ftoaPrecision :: Int -> Double -> [Char]
ftoaPrecision prec = signedShow (ftoaP . (+ (iterN prec (*0.1) 0.5))) where
	iterN :: Int -> (Double->Double) -> Double -> Double
	iterN n f x = if n<=0 then x else f (iterN (n-1) f x)
	signedShow :: (Double -> [Char]) -> Double -> [Char]
	signedShow f s
		| s<0 = ('-':(f (negate s)))
		| otherwise = f s
	ftoaP :: Double -> [Char]
	ftoaP s = let
		ival = floor s
		mval = s - fromIntegral ival
		mpart :: Int -> Double -> [Char]
		mpart togo cur
			| togo <= 0 = ""
			| otherwise = let
				c10 = cur * 10.0
				d = floor c10
				in (digitFromInt d:(mpart (togo-1) (c10-fromIntegral d)))
		in uitoa ival ++ (if prec>0 then ('.':mpart prec mval) else "")
ftoa = ftoaPrecision 6

splitStr d s = let
	appendHead a l = case l of
		[] -> [[a]]
		(h:r) -> (a:h):r
	in foldr (\a r -> if a == d then ([]:r) else appendHead a r) [] s

foldr10 :: (a->b->b) -> (a->b) -> b -> [a] -> b
foldr10 f f1 x0 l = case l of
	[] -> x0
	(h:[]) -> f1 h
	(h:r) -> f h (foldr10 f f1 x0 r)
join sep = foldr10 (\x y -> x ++ sep ++ y) id []

readMat :: Int -> IO [[Double]]
readMat n = if n==0 then return [] else do
	line <- getLine
	let row = (map atof (splitStr ' ' line))
	remain <- readMat (n-1)
	return (row:remain)

writeMat :: [[Double]] -> IO ()
writeMat l = case l of
	[] -> return ()
	(row:remain) -> do
		putStrLn (join " " (map ftoa row))
		writeMat remain

matMul :: [[Double]] -> [[Double]] -> [[Double]]
matMul a b = map mulVec a where
	mulVec :: [Double] -> [Double]
	mulVec = foldr10 (zipWith (+)) id [] . zipWith (\l a -> map (*a) l) b

main = do
	line <- getLine
	let (n:k:m:[]) = map (read::[Char]->Int) (splitStr ' ' line)
	m1 <- readMat n
	m2 <- readMat k
	let m3 = matMul m1 m2
	writeMat m3

module UParse where

import Data.Char

data SToken = SUnresolved [Char] | SIntConst Int | SDoubleConst Double
type STokenPos = (SToken,Int)

applySnd f (x,y) = (x,f y)
applyPair f g (x,y) = (f x,g y)
consFst a (x,y) = (a:x,y)

dropSpaceAndComment :: [Char] -> [Char]
dropSpaceAndComment x
	| null x = []
	| isSpace (head x) = dropSpaceAndComment (tail x)
	| (head x)==';' = dropSpaceAndComment (dropWhile (/='\n') (tail x))
	| otherwise = x

groupUntil get_next should_stop s
	| should_stop s = ([],s)
	| otherwise = (cur:remain_group,remain_s) where
		(cur,s_other) = get_next s
		(remain_group,remain_s) = groupUntil get_next should_stop s_other

parseToStrings :: [Char] -> [[Char]]
parseToStrings = parseToStrings' . dropSpaceAndComment where
	parseToStrings' = fst.(groupUntil nextString' null)
	nextString' = (applySnd dropSpaceAndComment).nextString
	nextString (x:xs)
		| elem x ['\'','"'] = (consFst x) (nextLexical x xs)
		| elem x ['(',')','\\'] = ([x],xs)
		| otherwise = (span validIdChar (x:xs))
	validIdChar a = not (isSpace a) && not (elem a ['(',')','\\'])
	nextLexical d [] = ([],[])
	nextLexical d (x:xs)
		| x==d = ([d],xs)
		| x=='\\' && not (null xs) && x1==d = (consFst x)$(consFst x1)$(nextLexical d x1s)
		| otherwise = consFst x (nextLexical d xs) where
		x1:x1s = xs


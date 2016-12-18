module UParse where

import Data.Char

type SPosition = (Int,Int)
data SMayFail a = SFail [Char] SPosition | SSucc a deriving Show
data SToken = STAtom [Char] | STInt Int | STDouble Double | SLeftPar | SRightPar | STLambda | STStr deriving Show
data STokenTree = STTNode SToken | STTList [(STokenTree,SPosition)]

instance Show STokenTree where
	show t = show' t 0 (0,0) where
		show' t indent pos = case t of
			STTNode token -> take indent (repeat ' ') ++ ((show token) ++" ;"++(show pos)++ "\n")
			STTList trees -> ((take indent (repeat ' '))++"STTree ;"++(show pos)++"\n")++concat (map (\(x,p) -> show' x (indent+4) p) trees)

data SSExp = SSInt Int | SSDouble Double | SSLambda [Char] (SSExp,SPosition) | SSRef [Char] | SSApply (SSExp,SPosition) (SSExp,SPosition) deriving Show
data SSImport = SSImport [Char] Bool deriving Show
data SSDef = SSDef [Char] (SSExp,SPosition) Bool deriving Show
data SSModule = SSMainModule [(SSImport,SPosition)] [(SSDef,SPosition)] (SSExp,SPosition) | SSSubModule [Char] [(SSImport,SPosition)] [(SSDef,SPosition)] deriving Show

instance Monad SMayFail where
	(SSucc a) >>= g = g a
	(SFail a b) >>= g = SFail a b
	return a = SSucc a

annotatePositions :: [Char] -> [(Char,SPosition)]
annotatePositions content = zip content (scanl (\(l0,c0) c -> 
	if c=='\n' then (l0+1,0) else (l0,c0+1)) (0,0) content)

dropWhiteSpace :: [(Char,SPosition)] -> [(Char,SPosition)]
dropWhiteSpace [] = []
dropWhiteSpace ((a,ap):ar)
	| isSpace a = dropWhiteSpace ar
	| a==';' = dropWhiteSpace (dropWhile (\(b,_) -> b/='\n') ar)
	| otherwise = ((a,ap):ar)

isValidCharInt :: Int -> Bool
isValidCharInt a = (a>=0 && a<1114112)

intFromDigits a = intFromDigits' a 0 where
	intFromDigits' [] cur = cur 
	intFromDigits' (d:ar) cur = intFromDigits' ar (cur*10+((ord d)-(ord '0')))


splitChrSpecial :: [(Char,SPosition)] -> SPosition -> SMayFail (Char,[(Char,SPosition)])
splitChrSpecial ar ap = case ar of
	[] -> SFail "incomplete escape sequence" ap
	(('a',_):arr) -> SSucc ('\a',arr)
	(('b',_):arr) -> SSucc ('\b',arr)
	(('n',_):arr) -> SSucc ('\n',arr)
	(('r',_):arr) -> SSucc ('\r',arr)
	(('v',_):arr) -> SSucc ('\v',arr)
	(('f',_):arr) -> SSucc ('\f',arr)
	(('t',_):arr) -> SSucc ('\t',arr)
	(('\\',_):arr) -> SSucc ('\\',arr)
	(('\'',_):arr) -> SSucc ('\'',arr)
	(('\"',_):arr) -> SSucc ('\"',arr)
	(('x',_):arr) -> let
		(npart,arrr) = span (\(x,_) -> isDigit x) arr in
		if null npart then SFail "\\x must be followed by digits" ap
		else let
			c_int=((intFromDigits (map fst npart))) in
			if isValidCharInt c_int then SSucc ((chr c_int),arrr)
			else SFail "\\x value not in range" ap
	((c,_):arr) -> SSucc (c,arr)
splitStrLiteral :: [(Char,SPosition)] -> SPosition -> SMayFail ((SToken,SPosition),[(Char,SPosition)])
splitStrLiteral ar ap = case ar of
	('"',_):arr -> SSucc ((STAtom "",ap),arr)
	('\\',arp):arr -> do
		(c,arrr) <- splitChrSpecial arr arp
		(((STAtom sr),_),arrrr) <- splitStrLiteral arrr ap
		return ((STAtom (c:sr),ap),arrrr)
	(ah,_):arr -> do
		(((STAtom sr),_),arrr) <- splitStrLiteral arr ap
		return ((STAtom (ah : sr),ap),arrr)
	[] -> SFail "unmatched \"" ap
splitCharLiteral :: [(Char,SPosition)] -> SPosition -> SMayFail ((SToken,SPosition),[(Char,SPosition)])
splitCharLiteral ar ap = case ar of
	('\'',_):[] -> SFail "empty ''" ap
	('\\',_):arr -> do
		(c,arrr) <- splitChrSpecial arr ap
		case arrr of
			('\'',_):arrr -> SSucc (((STInt (ord c)),ap),arrr)
			_ -> SFail "unmatched \'" ap
	(c0,_):('\'',_):arr -> SSucc (((STInt (ord c0)),ap),arr)
	[] -> SFail "unmatched \"" ap

isStopChar c = isSpace c || elem c "()\\;"
splitNumLiteral :: [(Char,SPosition)] -> SMayFail ((SToken,SPosition),[(Char,SPosition)]) 
splitNumLiteral a = let
	ap = snd (head a)
	(sign,a1) = (case a of
		('+',_):ar -> (1,ar)
		('-',_):ar -> ((-1),ar)
		ar -> (1,ar)
		)
	(before_dot,after_dot1) = span (isDigit.fst) a1 in
	if (null after_dot1) || (isStopChar$fst$head$after_dot1) then 
		SSucc (((STInt (((intFromDigits (map fst before_dot)))*sign)),snd (head a)),after_dot1)
	else let
		after_dot = (case after_dot1 of
			('.',_):r -> r
			r -> r
			)
		(before_e,after_e1) = span (isDigit.fst) after_dot 
		(has_e,after_e) = (case after_e1 of
			('e',_):r -> (True,r)
			('E',_):r -> (True,r)
			r -> (False,r)
			)
		(sign_e,after_es) =(if has_e then (case after_e of
				('+',_):r -> (1,r)
				('-',_):r -> ((-1),r)
				r -> (1,r)
			)else (1,after_e)
			)
		(before_end,remain) = span (isDigit.fst) after_es in
		if has_e && null before_end then SFail "invalid float literal " (snd (head a)) else let
			int_part = intFromDigits (map fst before_dot)
			mentisa_part = (sum (zipWith (*) (map (\(x,_) -> fromIntegral ((ord x)-(ord '0'))) before_e) (iterate (*0.1) 0.1)))::Double
			e_part = (if has_e then (10.0 ** (fromIntegral (sign_e * intFromDigits (map fst before_end)))) else 1.0)::Double in
			SSucc (((STDouble ((fromIntegral sign)*((fromIntegral int_part)+mentisa_part)*e_part)),ap),remain)
	
splitFirstString :: [(Char,SPosition)] -> SMayFail ((SToken,SPosition),[(Char,SPosition)])
splitFirstString ((a,ap):ar)
	| a=='(' = SSucc ((SLeftPar,ap),ar)
	| a==')' = SSucc ((SRightPar,ap),ar)
	| a=='\\' = SSucc ((STLambda,ap),ar)
	| a=='"' = splitStrLiteral ar ap
	| a=='\'' = splitCharLiteral ar ap
	| elem a "0123456789" || (elem a "+-." && (not (null ar)) && elem (fst (head ar)) "0123456789") = splitNumLiteral ((a,ap):ar)
	| elem a "0123456789" = SFail "invalid number literal" ap
	| otherwise = (let (al,arr) =span (\(x,_) -> not (isStopChar x)) ((a,ap):ar) in
		SSucc ((STAtom (map fst al),ap),arr))
groupStrings :: [(Char,SPosition)] -> SMayFail [(SToken,SPosition)] 
groupStrings = groupStrings' . dropWhiteSpace where
	groupStrings' [] = SSucc []
	groupStrings' a = do
		(f,r) <- splitFirstString a
		remain <- groupStrings r
		return (f:remain)

groupTokenTree :: [(SToken,SPosition)] -> SMayFail (STokenTree,SPosition)
groupTokenTree [] = SFail "empty file" (0,0)
groupTokenTree a = (groupTokenTree' a) >>= (\(r,remain) -> case remain of
	[] -> SSucc r
	((_,p)):_ -> SFail "extra tokens at end of file" p
	) where
	groupTokenTree' a = case a of
		((SLeftPar,p):r) -> do
			(trees,remain) <- groupUntilRightPar r p
			if null trees then SFail "empty ()" p else
				return (((STTList trees),p),remain)
		((SRightPar,p):r) -> SFail "unmatched )" p
		((ah,p):r) -> return (((STTNode ah),p),r)
	groupUntilRightPar a sp = case a of
		[] -> SFail "unmatched (" sp
		((SRightPar,_):r) -> return ([],r)
		_ -> do
			(t,rr) <- groupTokenTree' a
			(ts,rrr) <- groupUntilRightPar rr sp
			return ((t:ts),rrr)

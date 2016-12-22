module UParse where

import Data.Char
import ULambdaExpression

type SPosition = (Int,Int)
data SMayFail a = SFail [Char] SPosition | SSucc a deriving Show
data SToken = STAtom [Char] | STInt Int | STDouble Double | SLeftPar | SRightPar | STLambda | STStr [Char] deriving Show
data STokenTree = STTNode SToken | STTList [(STokenTree,SPosition)]

instance Show STokenTree where
	show t = show' t 0 (0,0) where
		show' t indent pos = case t of
			STTNode token -> take indent (repeat ' ') ++ ((show token) ++" ;"++(show pos)++ "\n")
			STTList trees -> ((take indent (repeat ' '))++"STTree ;"++(show pos)++"\n")++concat (map (\(x,p) -> show' x (indent+4) p) trees)

data SSExp = SSInt Int | SSDouble Double | SSLambda [Char] (SSExp,SPosition) | SSRef [Char] | SSApply (SSExp,SPosition) (SSExp,SPosition)
data SVisibility = SVLocal | SVGlobal deriving Show
data SImportMode = SIQualified | SIUnqualified deriving (Show,Eq)
data SSImport = SSImport [Char] SImportMode deriving Show
data SSDef = SSDef [Char] (SSExp,SPosition) SVisibility deriving Show
data SSModule = SSModule [(SSImport,SPosition)] [(SSDef,SPosition)] deriving Show

instance Show SSExp where
	show t = show' t 0 (0,0) where
		show' t indent pos = case t of
			SSInt val -> ((show val) ++" #|"++(show pos)++"|#")
			SSDouble val -> ((show val) ++" #|"++(show pos)++"|#")
			SSRef name -> (name ++" #|"++(show pos)++"|#")
			SSLambda name (e,p) -> ("(\\"++name ++" ;"++(show pos)++ "\n" ++ (take indent (repeat ' ')) ++ show' e (indent+4) p ++(take indent (repeat ' '))++")")
			SSApply (e1,p1) (e2,p2) -> ("("++ show' e1 (indent+4) p1 ++ "\n" ++ (take indent (repeat ' '))++show' e2 (indent+4) p2++")")


instance Monad SMayFail where
	(SSucc a) >>= g = g a
	(SFail a b) >>= g = SFail a b
	return a = SSucc a

annotatePositions :: [Char] -> [(Char,SPosition)]
annotatePositions content = zip content (scanl (\(l0,c0) c -> 
	if c=='\n' then (l0+1,0) else (l0,c0+1)) (0,0) content)

dropWhiteSpace :: [(Char,SPosition)] -> SMayFail [(Char,SPosition)]
dropWhiteSpace [] = return []
dropWhiteSpace ((a,ap):ar)
	| isSpace a = dropWhiteSpace ar
	| a==';' = dropWhiteSpace (dropWhile (\(b,_) -> b/='\n') ar)
	| a=='#' && not (null ar) && (fst (head ar))=='|' = waitUntilClose (tail ar) ap
	| otherwise = return ((a,ap):ar) where
		waitUntilClose [] ap = SFail "unclosed block comment" ap
		waitUntilClose (_:[]) ap = SFail "unclosed block comment" ap
		waitUntilClose (('|',_):('#',_):arr) ap = dropWhiteSpace arr
		waitUntilClose (_:arr) ap = waitUntilClose arr ap

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
	('"',_):arr -> SSucc ((STStr "",ap),arr)
	('\\',arp):arr -> do
		(c,arrr) <- splitChrSpecial arr arp
		(((STStr sr),_),arrrr) <- splitStrLiteral arrr ap
		return ((STStr (c:sr),ap),arrrr)
	(ah,_):arr -> do
		(((STStr sr),_),arrr) <- splitStrLiteral arr ap
		return ((STStr (ah : sr),ap),arrr)
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
	_ -> SFail "unmatched \'" ap

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
groupStrings = (\x -> (dropWhiteSpace x) >>= groupStrings') where
	groupStrings' [] = SSucc []
	groupStrings' a = do
		(f,r) <- splitFirstString a
		remain <- groupStrings r
		return (f:remain)

firstTokenTree :: [(SToken,SPosition)] -> SMayFail ((STokenTree,SPosition),[(SToken,SPosition)])
firstTokenTree a = case a of
	((SLeftPar,p):r) -> do
		(trees,remain) <- groupUntilRightPar r p
		if null trees then SFail "empty ()" p else
			return (((STTList trees),p),remain)
	((SRightPar,p):r) -> SFail "unmatched )" p
	((ah,p):r) -> return (((STTNode ah),p),r)
	where
		groupUntilRightPar a sp = case a of
			[] -> SFail "unmatched (" sp
			((SRightPar,_):r) -> return ([],r)
			_ -> do
				(t,rr) <- firstTokenTree a
				(ts,rrr) <- groupUntilRightPar rr sp
				return ((t:ts),rrr)
singleTokenTree a = do
	case a of
		[] -> SFail "empty line" (0,0)
		_ -> do
			(t,r) <- firstTokenTree a
			case r of
				[] -> SSucc t
				((_,p):r) -> SFail "extra token" p
groupTokenTree :: [(SToken,SPosition)] -> SMayFail [(STokenTree,SPosition)]
groupTokenTree a = case a of
	[] -> SSucc []
	_ -> do
		(tt,remain) <- (firstTokenTree a)
		rt <- groupTokenTree remain
		return (tt:rt)

parseSSExp :: (STokenTree,SPosition) -> SMayFail (SSExp,SPosition)
parseSSExp (tree,sp) = case tree of
	STTNode (STAtom name) -> return (SSRef name,sp)
	STTNode (STInt val) -> return (SSInt val,sp)
	STTNode (STDouble val) -> return (SSDouble val,sp)
	STTNode (STStr val) -> return (constructStrSugar val sp)
	STTNode _ -> SFail "illegal token " sp
	STTList (((STTNode STLambda),p):r) -> constructLambdaSugar r p
	STTList (((STTNode (STAtom "lambda")),p):r) -> constructLambdaSugar r p
	STTList (((STTNode (STAtom "list")),p):[]) -> SFail "list expression must not be empty" p
	STTList (((STTNode (STAtom "list")),p):r) -> constructListSugar r p
	STTList (((STTNode (STAtom "run")),p):r) -> constructRunSugar r p
	STTList (((STTNode (STAtom "do")),p):r) -> constructDoSugar r p
	STTList (((STTNode (STAtom "let")),p):r) -> constructLetSugar r p
	STTList [] -> SFail "empty expression" sp
	STTList (_:[]) -> SFail "extra parenthesis" sp
	STTList (f:r) -> do
		(e1,p1) <- parseSSExp f
		constructApplySugar r (e1,p1)
	where
		constructStrSugar [] sp = ((SSRef "empty"),sp)
		constructStrSugar (a:ar) sp = ((SSApply (SSApply (SSRef "cons",sp) ((SSInt (ord a)),sp),sp) (constructStrSugar ar sp)),sp)
		constructLambdaSugar [] p = SFail "incomplete lambda expression" p
		constructLambdaSugar (_:[]) p = SFail "incomplete lambda expression" p
		constructLambdaSugar ((STTNode (STAtom name),p1):body:[]) p = do
			(ebody,pb) <- parseSSExp body
			return ((SSLambda name (ebody,pb)),p1)
		constructLambdaSugar ((_,p1):_:[]) p = SFail "lambda expression needs a variable name" p1
		constructLambdaSugar ((STTNode (STAtom name),p1):r) p = do
			(ebody,pb) <- constructLambdaSugar r p
			return ((SSLambda name (ebody,pb)),p1)
		constructLambdaSugar ((_,p1):_) p = SFail "lambda expression needs a variable name" p1
		constructListSugar [] p = return ((SSRef "empty"),p)
		constructListSugar (f:r) p = do
			(e1,p1) <- parseSSExp f
			(remain,p2) <- constructListSugar r p
			return ((SSApply ((SSApply ((SSRef "cons"),p1) (e1,p1)),p1) (remain,p2)),p1)
		constructApplySugar [] (e,p) = SSucc (e,p)
		constructApplySugar (f:r) (e,p) = do
			(e1,p1) <- parseSSExp f
			constructApplySugar r ((SSApply (e,p) (e1,p1)),p)
		constructDoSugar r p = do
			(e1,p1) <- constructRunSugar r p
			return (SSLambda "return" (e1,p1),p)
		constructRunSugar [] p = SFail "empty do/run clause" p
		constructRunSugar (h:[]) p = parseSSExp h
		constructRunSugar ((STTList [(STTNode (STAtom "let"),p0),(STTNode (STAtom name),_),e],p_0):r) p = do
			(e1,p1) <- parseSSExp e
			(e2,p2) <- constructRunSugar r p
			return (SSApply (SSLambda name (e2,p2),p_0) (e1,p1),p0)
		constructRunSugar ((STTList [(STTNode (STAtom name),p0),e],_):r) p = do
			(e1,p1) <- parseSSExp e
			(e2,p2) <- constructRunSugar r p
			return (SSApply (e1,p1) (SSLambda name (e2,p2),p0),p0)
		constructRunSugar ((_,p1):r) p = SFail "invalid syntax in do/run clause" p1
		constructLetSugar [] p = SFail "empty let clause" p
		constructLetSugar (h:[]) p = parseSSExp h
		constructLetSugar ((STTList [(STTNode (STAtom name),p0),e],_):r) p = do
			(e1,p1) <- parseSSExp e
			(e2,p2) <- constructLetSugar r p
			return (SSApply (SSLambda name (e2,p2),p0) (e1,p1),p0)
		constructLetSugar ((_,p1):_) _ = SFail "invalid syntax in let clause" p1


parseSSModule :: [(STokenTree,SPosition)] -> SMayFail SSModule
parseSSModule trees = do
	(simports,others1) <- getImportBlock trees
	(sdefs,others2) <- getDefBlock others1
	(case others2 of
		[] -> return (SSModule simports sdefs)
		((e,p):[]) -> do
			(e1,p1) <- parseSSExp (e,p)
			return (SSModule simports (sdefs++[((SSDef "main" (e1,p1) SVGlobal),p)]))
		r -> SFail ("illegal declaration") (snd (head r))
		) where
		getImportBlock blocks = case blocks of
			[] -> SSucc ([],[])
			((STTList [(STTNode (STAtom "import*"),_),(STTNode (STAtom name),_)]),p1):r -> do
				(sis,remain) <- getImportBlock r
				return ((((SSImport name SIUnqualified),p1):sis),remain)
			((STTList [(STTNode (STAtom "import"),_),(STTNode (STAtom name),_)]),p1):r -> do
				(sis,remain) <- getImportBlock r
				return ((((SSImport name SIQualified),p1):sis),remain)
			_ -> SSucc ([],blocks)
		getDefBlock blocks = case blocks of
			[] -> SSucc ([],[])
			((STTList [(STTNode (STAtom "def"),_),(STTNode (STAtom name),_),body]),p1):r -> do 
				(firstexp,p2) <- parseSSExp body
				(sds,remain) <- getDefBlock r
				return ((((SSDef name (firstexp,p2) SVGlobal),p1):sds),remain)
			((STTList [(STTNode (STAtom "let"),_),(STTNode (STAtom name),_),body]),p1):r -> do 
				(firstexp,p2) <- parseSSExp body
				(sds,remain) <- getDefBlock r
				return ((((SSDef name (firstexp,p2) SVLocal),p1):sds),remain)
			_ -> SSucc ([],blocks)

extractLExpr :: SSExp -> LExpr
extractLExpr s = case s of
	(SSInt v) -> LInt v
	(SSDouble v) -> LDouble v
	(SSLambda a (v,_)) -> LAbs a (extractLExpr v)
	(SSRef v) -> LRef v
	(SSApply (v1,_) (v2,_)) -> LApply (extractLExpr v1) (extractLExpr v2)

parseSTokenTreeStr a = (groupStrings $ annotatePositions a) >>= singleTokenTree
parseLExprStr a = parseSTokenTreeStr a >>= parseSSExp >>= (return . extractLExpr.fst)
parseSSModuleStr a = (groupStrings $ annotatePositions a) >>= groupTokenTree >>= parseSSModule

module UOptimize where
import ULambdaExpression
import qualified Data.Set as Set

data LExprA a = LIntA a Int | LDoubleA a Double | LRefA a [Char] | LAbsA a [Char] (LExprA a) | LApplyA a (LExprA a) (LExprA a) deriving Show

getAnnot :: LExprA a -> a
getAnnot (LIntA a _) = a 
getAnnot (LDoubleA a _) = a 
getAnnot (LRefA a _) = a 
getAnnot (LAbsA a _ _) = a 
getAnnot (LApplyA a _ _) = a 

stripAnnot :: LExprA a -> LExpr
stripAnnot (LIntA _ v) = LInt v
stripAnnot (LDoubleA _ v) = LDouble v
stripAnnot (LRefA _ v) = LRef v
stripAnnot (LAbsA _ k v) = LAbs k (stripAnnot v)
stripAnnot (LApplyA _ f x) = LApply (stripAnnot f) (stripAnnot x)

type FreeVarInfo = Set.Set [Char]

annotateFreeVar :: LExpr -> LExprA FreeVarInfo
annotateFreeVar l = case l of
	LInt v -> LIntA (Set.fromList []) v
	LDouble v -> LDoubleA (Set.fromList []) v
	LRef k -> LRefA (Set.fromList [k]) k
	LAbs k v -> let
		body = annotateFreeVar v
		in LAbsA (Set.delete k (getAnnot body)) k body
	LApply f x -> let
		lf = annotateFreeVar f
		lx = annotateFreeVar x
		unpruned = LApplyA (Set.union (getAnnot lf) (getAnnot lx)) lf lx 
		in case lf of
			LAbsA _ k fbody 
				| not$Set.member k (getAnnot fbody) -> fbody
				| otherwise -> unpruned
			_ -> unpruned

optimizeLExpr = stripAnnot . annotateFreeVar

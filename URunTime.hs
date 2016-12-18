module URunTime where

import qualified Data.Map as Map
import UData
import UEnvironment

data VComp = VComp BCompType | VComp1 BCompType BNum deriving Show
data VSysCall = VExit | VExit1 Int | VOpen | VOpen1 [Int] | VOpen2 [Int] Int | VOpen3 [Int] Int VResult | VClose | VClose1 Int | VClose2 Int VResult | VGetChar | VGetChar1 Int | VGetChar2 Int VResult | VPeekChar | VPeekChar1 Int | VPeekChar2 Int VResult | VPutChar | VPutChar1 Int | VPutChar2 Int Int | VPutChar3 Int Int VResult | VGetArg | VGetArg1 VResult deriving Show
data Value = VBuiltin BValue | VAbs [Char] VExpression | VCompFunc VComp | VSys VSysCall  deriving Show
data VExpression = VClean Value | VApply VExpression VExpression | VRef [Char]  deriving Show
type VContext=Map.Map [Char] VResult
type BoundValue = (Value,VContext)
data VResult = VGood BoundValue | VException [Char] deriving Show

veAbs a b = VClean (VAbs a b)

vTrue = VAbs "x" (veAbs "y" (VRef "x"))
vFalse = VAbs "x" (veAbs "y" (VRef "y"))
vEmpty = VAbs "f" (veAbs "g" (VRef "f"))
vCons = VAbs "x" (veAbs "y" (veAbs "f" (veAbs "g" (VApply (VApply (VRef "g") (VRef "x")) (VRef "y")))))
veTrue = VClean vTrue
veFalse = VClean vFalse
veCons = VClean vCons
veEmpty = VClean vEmpty
boolValue :: Bool -> Value
boolValue True = vTrue
boolValue False = vTrue

veInt a=VClean (VBuiltin (BNumVal (BInt a)))
veFloat a=VClean (VBuiltin (BNumVal (BFloat a)))

vBuiltInList=[
	("+", (VBuiltin (BFuncVal (BArith2Func BAdd)))),
	("-", (VBuiltin (BFuncVal (BArith2Func BSub)))),
	("*", (VBuiltin (BFuncVal (BArith2Func BMul)))),
	("/", (VBuiltin (BFuncVal (BArith2Func BDiv)))),
	("%", (VBuiltin (BFuncVal (BArith2Func BMod)))),
	("<", (VCompFunc (VComp BLe))),
	(">=", (VCompFunc (VComp BNLe))),
	(">", (VCompFunc (VComp BGe))),
	("<=", (VCompFunc (VComp BNGe))),
	("/=", (VCompFunc (VComp BEq))),
	("==", (VCompFunc (VComp BNEq))),
	("exit", (VSys (VExit))),
	("open", (VSys (VOpen))),
	("close", (VSys (VClose))),
	("getChar", (VSys (VGetChar1 0))),
	("getCharF", (VSys (VGetChar))),
	("peekChar", (VSys (VPeekChar1 0))),
	("peekCharF", (VSys (VPeekChar))),
	("putChar", (VSys (VPutChar1 1))),
	("putCharF", (VSys (VPutChar))),
	("getArgs", (VSys (VGetArg))),
	("makeIntList", (VBuiltin (BIntList [])))
	]

emptyContext = (Map.empty::VContext)
veBuiltInDict = Map.fromList (map (\(x,y) -> (x,(VClean y))) vBuiltInList)
vrBuiltInDict = Map.fromList (map (\(x,y) -> (x,(VGood (y, emptyContext)))) vBuiltInList)


applyFunc :: BoundValue -> VResult -> VResult
applyFunc ((VBuiltin a),ca) br = (case br of
	(VException e) -> VException e
	(VGood (VBuiltin b,_)) -> bValToVResult (applyBVal  a b)
	)where
		bValToVResult (BException e) = VException e
		bValToVResult (BClean v) = VGood (VBuiltin v,emptyContext)
applyFunc ((VAbs k v),ca) br = evalExp v (Map.insert k br ca)
applyFunc (VCompFunc (VComp c),_) br = case br of
					  	(VException e)                     -> VException e
						(VGood ((VBuiltin (BNumVal a)),_)) -> VGood (VCompFunc (VComp1 c a),emptyContext)
						_                                  -> VException "cannot compare non-numeric values"
applyFunc (VCompFunc (VComp1 c a),_) br = case br of
						(VException e)                     -> VException e
						(VGood ((VBuiltin (BNumVal b)),_)) -> VGood (boolValue (compBNum c a b),emptyContext)
						_                                  -> VException "cannot compare non-numeric values"
applyFunc (VSys VExit,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VExit1 b),emptyContext)
						_                                         -> VException "cannot call Exit with non-integer value"
applyFunc (VSys (VExit1 _),_) _ = VException "too many arguments given to syscall exit"
applyFunc (VSys VOpen,_) br = case br of
						(VException e)                      -> VException e
						(VGood ((VBuiltin (BIntList b)),_)) -> VGood (VSys (VOpen1 (reverse b)),emptyContext)
						_                                   -> VException "cannot call Open with non-IntList filename"
applyFunc (VSys (VOpen1 a),_) br = case br of
						(VException e)                      -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VOpen2 a b),emptyContext)
						_                                   -> VException "cannot call Open with non-integer mode"
applyFunc (VSys (VOpen2 a b),_) br = VGood (VSys (VOpen3 a b br),emptyContext)
applyFunc (VSys (VOpen3 _ _ _),_) _ = VException "too many arguments given to syscall open"
applyFunc (VSys VClose,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VClose1 b),emptyContext)
						_                                         -> VException "cannot call Close with non-integer handle"
applyFunc (VSys (VClose1 a),_) br = VGood (VSys (VClose2 a br),emptyContext)
applyFunc (VSys (VClose2 _ _),_) _ = VException "too many arguments given to syscall close"
applyFunc (VSys VGetChar,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VGetChar1 b),emptyContext)
						_                                         -> VException "cannot call GetChar with non-integer handle"
applyFunc (VSys (VGetChar1 a),_) br = VGood (VSys (VGetChar2 a br),emptyContext)
applyFunc (VSys (VGetChar2 _ _),_) _ = VException "too many arguments given to syscall getChar"
applyFunc (VSys VPeekChar,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VPeekChar1 b),emptyContext)
						_                                         -> VException "cannot call PeekChar with non-integer handle"
applyFunc (VSys (VPeekChar1 a),_) br = VGood (VSys (VPeekChar2 a br),emptyContext)
applyFunc (VSys (VPeekChar2 _ _),_) _ = VException "too many arguments given to syscall peekChar"
applyFunc (VSys VPutChar,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VPutChar1 b),emptyContext)
						_                                         -> VException "cannot call PutChar with non-integer handle"
applyFunc (VSys (VPutChar1 a),_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VPutChar2 a b),emptyContext)
						_                                         -> VException "cannot call PutChar with non-integer handle"
applyFunc (VSys (VPutChar2 a b),_) br = VGood (VSys (VPutChar3 a b br),emptyContext)
applyFunc (VSys (VPutChar3 _ _ _),_) _ = VException "too many arguments given to syscall putChar"
applyFunc (VSys VGetArg,_) br = VGood (VSys (VGetArg1 br),emptyContext)
applyFunc (VSys (VGetArg1 _),_) br = VException "too many arguments given to syscall getArgs"

evalExp :: VExpression -> VContext -> VResult
evalExp (VClean v) context = VGood (v,context)
evalExp (VApply a b) context = (case (evalExp a context) of
	(VException e) -> VException e
	(VGood (av,ac)) -> applyFunc (av,ac) (evalExp b context)
	)
evalExp (VRef k) context = case (Map.lookup k context) of
	Nothing -> VException ("cannot find variable "++k)
	Just v -> v

feedVResult :: VResult -> VExpression -> VResult
feedVResult (VException e) _ = (VException e)
feedVResult (VGood (cont,context)) val = evalExp (VApply (VClean cont) val) context

executeVResult :: (UEnv e) => (Monad e) => VResult -> e ()
executeVResult vr = case vr of
	VException e -> eException e
	VGood (val,context) -> (case val of
		(VSys (VExit1 e)) -> eExit e
		(VSys (VOpen3 f m cont)) -> (eOpen f m) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VClose2 f cont)) -> (eClose f) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VPutChar3 f c cont)) -> (ePutChar f c) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VGetChar2 f cont)) -> (eGetChar f) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VPeekChar2 f cont)) -> (ePeekChar f) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VGetArg1 cont)) -> eGetArg >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys _) -> eException "insufficient syscall args"
		_ -> eException "expression not evaluated to a syscall"
		)
executeVExp :: (UEnv e) => (Monad e) => VExpression -> e()
executeVExp exp = executeVResult (evalExp exp vrBuiltInDict)

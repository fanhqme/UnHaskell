module URunTime where

import qualified Data.Map as Map
import UData
import UEnvironment
import ULambdaExpression
import Control.Monad.Trans.Class

data VComp = VComp BCompType | VComp1 BCompType BNum deriving Show
data VSysCall = VExit | VExit1 Int | VOpen | VOpen1 [Int] | VOpen2 [Int] Int | VOpen3 [Int] Int VResult | VClose | VClose1 Int | VClose2 Int VResult | VGetChar | VGetChar1 Int | VGetChar2 Int VResult | VPeekChar | VPeekChar1 Int | VPeekChar2 Int VResult | VPutChar | VPutChar1 Int | VPutChar2 Int Int | VPutChar3 Int Int VResult | VGetArg | VGetArg1 VResult | VSystem | VSystem1 [Int] | VSystem2 [Int] VResult deriving Show
data Value = VBuiltin BValue | VAbs [Char] VExpression | VCompFunc VComp | VSys VSysCall  deriving Show
data VExpression = VClean Value | VApply VExpression VExpression | VRef [Char]  deriving Show
type VContext=Map.Map [Char] VResult
type BoundValue = (Value,VContext)
data VResult = VGood BoundValue | VException [Char] deriving Show

showVComp (VComp b) = showBCompType b
showVComp (VComp1 b v) = "("++(showBCompType b)++" "++(showBNum v)++")"

showVSysCall VExit = "exit"
showVSysCall (VExit1 v) = "(exit "++(show v)++")"
showVSysCall VOpen = "open"
showVSysCall (VOpen1 v) = "(open "++(showBValue (BIntList v))++")"
showVSysCall (VOpen2 v a) = "(open "++(showBValue (BIntList v))++" "++(show a)++")"
showVSysCall (VOpen3 v a _) = "(open "++(showBValue (BIntList v))++" "++(show a)++" ...)"
showVSysCall VClose = "close"
showVSysCall (VClose1 v) = "(close "++(show v)++")"
showVSysCall (VClose2 v _) = "(close "++(show v)++" ...)"
showVSysCall VGetChar = "getChar"
showVSysCall (VGetChar1 v) = "(getChar "++(show v)++")"
showVSysCall (VGetChar2 v _) = "(getChar "++(show v)++" ...)"
showVSysCall VPeekChar = "peekChar"
showVSysCall (VPeekChar1 v) = "(peekChar "++(show v)++")"
showVSysCall (VPeekChar2 v _) = "(peekChar "++(show v)++" ...)"
showVSysCall VPutChar = "putChar"
showVSysCall (VPutChar1 v) = "(putChar "++(show v)++")"
showVSysCall (VPutChar2 v a) = "(putChar "++(show v)++" "++(show a)++")"
showVSysCall (VPutChar3 v a _) = "(putChar "++(show v)++" "++(show a)++" ...)"
showVSysCall (VGetArg) = "getArg"
showVSysCall (VGetArg1 _) = "(getArg ...)"
showVSysCall (VSystem) = "system"
showVSysCall (VSystem1 v) = "(system "++(showBValue (BIntList v))++")"
showVSysCall (VSystem2 v _) = "(system "++(showBValue (BIntList v))++" ...)"

showValue :: Value -> [Char]
showValue (VBuiltin b) = showBValue b
showValue (VAbs name e) = "(\\"++name++" "++(showVExpression e)++")"
showValue (VCompFunc v) = showVComp v
showValue (VSys v) = showVSysCall v

showVExpression :: VExpression -> [Char]
showVExpression e = case e of
	(VRef v) -> v
	(VApply v1 v2) -> "("++(showVExpression v1)++" "++(showVExpression v2)++")"
	(VClean v) -> showValue v

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
boolValue False = vFalse

veInt a=VClean (VBuiltin (BNumVal (BInt a)))
veDouble a=VClean (VBuiltin (BNumVal (BFloat a)))

vBuiltInList=[
	("+", (VBuiltin (BFuncVal (BArith2Func BAdd)))),
	("-", (VBuiltin (BFuncVal (BArith2Func BSub)))),
	("*", (VBuiltin (BFuncVal (BArith2Func BMul)))),
	("/", (VBuiltin (BFuncVal (BArith2Func BDiv)))),
	("%", (VBuiltin (BFuncVal (BArith2Func BMod)))),
	("toInt", (VBuiltin (BFuncVal (BArithFunc BToInt)))),
	("toFloat", (VBuiltin (BFuncVal (BArithFunc BToFloat)))),
	("<", (VCompFunc (VComp BLe))),
	(">=", (VCompFunc (VComp BNLe))),
	(">", (VCompFunc (VComp BGe))),
	("<=", (VCompFunc (VComp BNGe))),
	("/=", (VCompFunc (VComp BNEq))),
	("=", (VCompFunc (VComp BEq))),
	("exit", (VSys (VExit))),
	("openCmd", (VSys (VOpen))),
	("close", (VSys (VClose))),
	("getChar", (VSys (VGetChar1 0))),
	("getCharF", (VSys (VGetChar))),
	("peekChar", (VSys (VPeekChar1 0))),
	("peekCharF", (VSys (VPeekChar))),
	("putChar", (VSys (VPutChar1 1))),
	("putCharF", (VSys (VPutChar))),
	("getArg", (VSys (VGetArg))),
	("systemCmd", (VSys (VSystem))),
	("consFileName", (VBuiltin (BIntList [])))
	]

emptyContext = (Map.empty::VContext)
veBuiltInDict = Map.fromList (map (\(x,y) -> (x,(VClean y))) vBuiltInList)
vrBuiltInDict = Map.fromList (map (\(x,y) -> (x,(VGood (y, emptyContext)))) vBuiltInList)


applyFunc :: BoundValue -> VResult -> VResult
applyFunc ((VBuiltin a),ca) br = (case br of
	(VException e) -> VException e
	(VGood (VBuiltin b,_)) -> bValToVResult (applyBVal  a b)
	(VGood x) -> VException ("cannot feed non-builtin value to builtin value "++(showBValue a))
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
						_                                         -> VException "cannot call exit with non-integer value"
applyFunc (VSys (VExit1 _),_) _ = VException "too many arguments given to syscall exit"
applyFunc (VSys VOpen,_) br = case br of
						(VException e)                      -> VException e
						(VGood ((VBuiltin (BIntList b)),_)) -> VGood (VSys (VOpen1 b),emptyContext)
						_                                   -> VException "cannot call open with non-IntList filename"
applyFunc (VSys (VOpen1 a),_) br = case br of
						(VException e)                      -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VOpen2 a b),emptyContext)
						_                                   -> VException "cannot call open with non-integer mode"
applyFunc (VSys (VOpen2 a b),_) br = VGood (VSys (VOpen3 a b br),emptyContext)
applyFunc (VSys (VOpen3 _ _ _),_) _ = VException "too many arguments given to syscall open"
applyFunc (VSys VClose,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VClose1 b),emptyContext)
						_                                         -> VException "cannot call close with non-integer handle"
applyFunc (VSys (VClose1 a),_) br = VGood (VSys (VClose2 a br),emptyContext)
applyFunc (VSys (VClose2 _ _),_) _ = VException "too many arguments given to syscall close"
applyFunc (VSys VGetChar,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VGetChar1 b),emptyContext)
						_                                         -> VException "cannot call getChar with non-integer handle"
applyFunc (VSys (VGetChar1 a),_) br = VGood (VSys (VGetChar2 a br),emptyContext)
applyFunc (VSys (VGetChar2 _ _),_) _ = VException "too many arguments given to syscall getChar"
applyFunc (VSys VPeekChar,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VPeekChar1 b),emptyContext)
						_                                         -> VException "cannot call peekChar with non-integer handle"
applyFunc (VSys (VPeekChar1 a),_) br = VGood (VSys (VPeekChar2 a br),emptyContext)
applyFunc (VSys (VPeekChar2 _ _),_) _ = VException "too many arguments given to syscall peekChar"
applyFunc (VSys VPutChar,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VPutChar1 b),emptyContext)
						_                                         -> VException "cannot call putChar with non-integer handle"
applyFunc (VSys (VPutChar1 a),_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BNumVal (BInt b))),_)) -> VGood (VSys (VPutChar2 a b),emptyContext)
						_                                         -> VException "cannot call putChar with non-integer handle"
applyFunc (VSys (VPutChar2 a b),_) br = VGood (VSys (VPutChar3 a b br),emptyContext)
applyFunc (VSys (VPutChar3 _ _ _),_) _ = VException "too many arguments given to syscall putChar"
applyFunc (VSys VGetArg,_) br = VGood (VSys (VGetArg1 br),emptyContext)
applyFunc (VSys (VGetArg1 _),_) br = VException "too many arguments given to syscall getArgs"
applyFunc (VSys VSystem,_) br = case br of
						(VException e)                            -> VException e
						(VGood ((VBuiltin (BIntList a)),_)) -> VGood (VSys (VSystem1 a),emptyContext)
						_                                         -> VException "cannot call system with non-IntList command"
applyFunc (VSys (VSystem1 a),_) br = VGood (VSys (VSystem2 a br),emptyContext)
applyFunc (VSys (VSystem2 _ _),_) _ = VException "too many arguments given to syscall system"

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

fromLExpr :: LExpr -> VExpression
fromLExpr l = case l of
	LInt v -> veInt v
	LDouble v -> veDouble v
	LRef v -> VRef v
	LAbs a v -> veAbs a (fromLExpr v)
	LApply a b -> VApply (fromLExpr a) (fromLExpr b)

executeVResult :: (UEnv e) => (Monad e) => VResult -> UEvalEnv (Value,VContext) e ()
executeVResult vr = case vr of
	VException e -> eException e
	VGood (val,context) -> case val of
		(VSys (VExit1 e)) -> eExit e
		(VSys (VOpen3 f m cont)) -> (lift$eOpen f m) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VClose2 f cont)) -> (lift$eClose f) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VPutChar3 f c cont)) -> (lift$ePutChar f c) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VGetChar2 f cont)) -> (lift$eGetChar f) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VPeekChar2 f cont)) -> (lift$ePeekChar f) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VGetArg1 cont)) -> (lift$eGetArg) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys (VSystem2 a cont)) -> (lift$eSystem a) >>= (\retval -> (executeVResult (feedVResult cont (veInt retval))))
		(VSys s) -> eException ("insufficient syscall args in "++(showVSysCall s))
		_ -> eReturnResult (val,context)

executeVExp :: (UEnv e) => (Monad e) => VExpression -> UEvalEnv (Value,VContext) e ()
executeVExp exp = executeVResult (evalExp exp vrBuiltInDict)

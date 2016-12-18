module URunTime where

import Data.Char
import Data.Int
import qualified Data.Map as Map

{- list of builtin functions
Add  Add1    builtin.+ a b
Sub  Sub1    builtin.- a b
Mul  Mul1    builtin.* a b
Div  Div1    builtin./ a b
Mod  Mod1    builtin.% a b
Eq  Eq1      builtin.= a b
NEq  NEq1      builtin.!= a b
Le  Le1      builtin.< a b
Ge  Ge1      builtin.> a b
NLe  NLe1      builtin.>= a b
NGe  NGe1      builtin.<= a b
ToInt        builtin.toInt a
ToFloat      builtin.toFloat a
-}

data BuiltinNode = BAdd | BAddI Int | BAddF Double |
	BSub | BSubI Int | BSubF Double |
	BMul | BMulI Int | BMulF Double |
	BMul | BMul1 Value | BDiv | BDiv1 Value |
	BMod | BMod1 Value | BToInt | BToFloat |
	BEq | BEq1 Value | BNEq | BNEq1 Value | 
	BLe | BLe1 Value | BGe | BGe1 Value |
	BNLe | BNLe1 Value | BNGe | BNGe1 Value
	deriving Show
data Value = IntVal Int | FloatVal Double | AbsNode Value | ApplyNode Value Value | RefNode Int | SyscallVal [Int] | BuiltinVal BuiltinNode | ExceptionVal [Char]  deriving Show

data BoundValue = BoundValue Value [BoundValue] deriving Show
pureValue v = BoundValue v []
stripBound (BoundValue v _) = v

isIntVal (IntVal _) = True
isIntVal _ = False
getIntVal (IntVal x) =x
isFloatVal (FloatVal _) = True
isFloatVal _ = False
getFloatVal (FloatVal x) =x

--(evalExp e) guarentees that e is not ApplyNode or RefNode
applyFunc :: BoundValue -> BoundValue -> BoundValue
applyFunc (BoundValue f f_context) (BoundValue x x_context) = case f of
	IntVal v -> pureValue (ExceptionVal "cannot use int as function")
	FloatVal v -> pureValue (ExceptionVal "cannot use float as function")
	AbsNode v -> evalExp (BoundValue v ((BoundValue x x_context):f_context))
	SyscallVal v -> pureValue (SyscallVal (x:v))
	BuiltinVal v -> pureValue (applyBuiltin v x)
	ExceptionVal v -> pureValue f     -- exception eats all value
evalExp :: BoundValue -> BoundValue
evalExp (BoundValue e context) = case e of
	ApplyNode f x -> applyFunc (evalExp (BoundValue f context)) (evalExp (BoundValue x context))
	RefNode v -> evalExp (context!!v)
	_ -> (BoundValue e context)

-- True = \x \y x
vTrue = AbsNode (AbsNode (RefNode 1))
-- False = \x \y y
vFalse = AbsNode (AbsNode (RefNode 0))

vFromBool True = vTrue
vFromBool False = vFalse

applyBuiltin :: BuiltinNode -> Value -> Value
applyBuiltin BAdd v = BuiltinVal (BAdd1 v)
applyBuiltin (BAdd1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> IntVal   (ai+bi)
	(FloatVal ai,FloatVal bi) -> FloatVal (ai+bi)
	(IntVal ai,  FloatVal bi) -> FloatVal (ai+bi)
	(FloatVal ai,IntVal bi  ) -> FloatVal (ai+bi)
	_ -> ExceptionVal "type mismatch for +"
applyBuiltin BSub v = BuiltinVal (BSub1 v)
applyBuiltin (BSub1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> IntVal   (ai-bi)
	(FloatVal ai,FloatVal bi) -> FloatVal (ai-bi)
	(IntVal ai,  FloatVal bi) -> FloatVal (ai-bi)
	(FloatVal ai,IntVal bi  ) -> FloatVal (ai-bi)
	_ -> ExceptionVal "type mismatch for -"
applyBuiltin BMul v = BuiltinVal (BMul1 v)
applyBuiltin (BMul1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> IntVal   (ai*bi)
	(FloatVal ai,FloatVal bi) -> FloatVal (ai*bi)
	(IntVal ai,  FloatVal bi) -> FloatVal (ai*bi)
	(FloatVal ai,IntVal bi  ) -> FloatVal (ai*bi)
	_ -> ExceptionVal "type mismatch for *"
applyBuiltin BDiv v = BuiltinVal (BDiv1 v)
applyBuiltin (BDiv1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  )
		| bi /= 0   -> IntVal (ai `div` bi)
		| otherwise -> ExceptionVal "divided by zero"
	(FloatVal ai,FloatVal bi) -> FloatVal (ai/bi)
	(IntVal ai,  FloatVal bi) -> FloatVal (ai/bi)
	(FloatVal ai,IntVal bi  ) -> FloatVal (ai/bi)
	_ -> ExceptionVal "type mismatch for /"
applyBuiltin BMod v = BuiltinVal (BMod1 v)
applyBuiltin (BMod1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> IntVal   (ai `mod` bi)
	_ -> ExceptionVal "invalid argument type for %"
applyBuiltin BLe v = BuiltinVal (BLe1 v)
applyBuiltin (BLe1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> vFromBool (ai<bi)
	(FloatVal ai,FloatVal bi) -> vFromBool (ai<bi)
	(IntVal ai,  FloatVal bi) -> vFromBool (ai<bi)
	(FloatVal ai,IntVal bi  ) -> vFromBool (ai<bi)
	_ -> ExceptionVal "type mismatch for <"
applyBuiltin BNLe v = BuiltinVal (BNLe1 v)
applyBuiltin (BNLe1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> vFromBool (ai>=bi)
	(FloatVal ai,FloatVal bi) -> vFromBool (ai>=bi)
	(IntVal ai,  FloatVal bi) -> vFromBool (ai>=bi)
	(FloatVal ai,IntVal bi  ) -> vFromBool (ai>=bi)
	_ -> ExceptionVal "type mismatch for >="
applyBuiltin BGe v = BuiltinVal (BGe1 v)
applyBuiltin (BGe1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> vFromBool (ai>bi)
	(FloatVal ai,FloatVal bi) -> vFromBool (ai>bi)
	(IntVal ai,  FloatVal bi) -> vFromBool (ai>bi)
	(FloatVal ai,IntVal bi  ) -> vFromBool (ai>bi)
	_ -> ExceptionVal "type mismatch for >"
applyBuiltin BNGe v = BuiltinVal (BNGe1 v)
applyBuiltin (BNGe1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> vFromBool (ai<=bi)
	(FloatVal ai,FloatVal bi) -> vFromBool (ai<=bi)
	(IntVal ai,  FloatVal bi) -> vFromBool (ai<=bi)
	(FloatVal ai,IntVal bi  ) -> vFromBool (ai<=bi)
	_ -> ExceptionVal "type mismatch for <="
applyBuiltin BEq v = BuiltinVal (BEq1 v)
applyBuiltin (BEq1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> vFromBool (ai==bi)
	(FloatVal ai,FloatVal bi) -> vFromBool (ai==bi)
	(IntVal ai,  FloatVal bi) -> vFromBool (ai==bi)
	(FloatVal ai,IntVal bi  ) -> vFromBool (ai==bi)
	_ -> ExceptionVal "type mismatch for ="
applyBuiltin BNEq v = BuiltinVal (BNEq1 v)
applyBuiltin (BNEq1 a) b = case (a,b) of
	(IntVal ai,  IntVal bi  ) -> vFromBool (ai/=bi)
	(FloatVal ai,FloatVal bi) -> vFromBool (ai/=bi)
	(IntVal ai,  FloatVal bi) -> vFromBool (ai/=bi)
	(FloatVal ai,IntVal bi  ) -> vFromBool (ai/=bi)
	_ -> ExceptionVal "type mismatch for /="
applyBuiltin BToInt v = case v of
	(IntVal ai) -> v
	(FloatVal ai) -> IntVal (floor ai)
	_ -> ExceptionVal "type mismatch for toInt"
applyBuiltin BToFloat v = case v of
	(IntVal ai) -> FloatVal ai
	(FloatVal ai) -> v
	_ -> ExceptionVal "type mismatch for toFloat"



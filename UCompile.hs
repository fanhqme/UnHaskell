module UCompile where
import ULambdaExpression
import qualified Data.Map as Map

compileToC :: LExpr -> [Char]
compileToC l = header++compileToCS l (Map.fromList []) 0 footer where
	header="void main_program(){\nexecuteVExp("
	footer=");\n}"
	compileToCS :: LExpr -> Map.Map [Char] Int -> Int -> ShowS
	compileToCS l names curlevel = case l of
		LInt v -> showString ("makeInt("++(show v)++")")
		LDouble v -> showString ("makeDouble("++(show v)++")")
		LRef key -> case (Map.member key names) of
			True -> showString ("makeRef("++(show (curlevel-(names Map.! key)))++")")
			False -> showString ("makeBuiltin(\""++key++"\")")
		LAbs key l2 -> showString "makeAbs(\n" . compileToCS l2 (Map.insert key curlevel names) (curlevel+1) . showString ")"
		LApply l1 l2 -> showString "makeApply(\n" . (compileToCS l1 names curlevel) . showString ",\n" . (compileToCS l2 names curlevel) . showString ")"

module UCompile where
import ULambdaExpression
import qualified Data.Map as Map

compileToC :: LExpr -> [Char]
compileToC l = header++compileToCS l (Map.fromList []) 0 footer where
	header="typedef struct VExp VExp;\n\
		\VExp * makeBuiltin(const char* func_name);\n\
		\VExp * makeInt(int a);\n\
		\VExp * makeDouble(double a);\n\
		\VExp * makeAbs(VExp* abs_val);\n\
		\VExp * makeRef(int ref_val);\n\
		\VExp * makeApply(VExp * f,VExp * x);\n\
		\int executeVExp(VExp * exp);\n\
		\int main(){\n\
		\return executeVExp("
	footer=");\n}"
	compileToCS :: LExpr -> Map.Map [Char] Int -> Int -> ShowS
	compileToCS l names curlevel = case l of
		LInt v -> showString ("makeInt("++(show v)++")")
		LDouble v -> showString ("makeDouble("++(show v)++")")
		LRef key -> case (Map.member key names) of
			True -> showString ("makeRef("++(show (curlevel-(names Map.! key)-1))++")")
			False -> showString ("makeBuiltin(\""++key++"\")")
		LAbs key l2 -> showString "makeAbs(\n" . compileToCS l2 (Map.insert key curlevel names) (curlevel+1) . showString ")"
		LApply l1 l2 -> showString "makeApply(\n" . (compileToCS l1 names curlevel) . showString ",\n" . (compileToCS l2 names curlevel) . showString ")"

compileToLLVM :: LExpr -> [Char]
compileToLLVM l = header.strblock.main_head.funcbody.footer $ "" where
	header = showString "%struct.VExp = type opaque\n"
	main_head = showString "define i32 @main() #0 {\n  %1 = alloca i32, align 4\n  store i32 0, i32* %1\n"
	footer = showString "declare i32 @executeVExp(%struct.VExp*) #1\n\
		\declare %struct.VExp* @makeApply(%struct.VExp*, %struct.VExp*)\n\
		\declare %struct.VExp* @makeBuiltin(i8*) #1\n\
		\declare %struct.VExp* @makeAbs(%struct.VExp*) #1\n\
		\declare %struct.VExp* @makeRef(i32) #1\n\
		\declare %struct.VExp* @makeDouble(double) #1\n\
		\declare %struct.VExp* @makeInt(i32) #1\n\
		\attributes #0 = { nounwind uwtable \"less-precise-fpmad\"=\"false\" \"no-frame-pointer-elim\"=\"true\" \"no-frame-pointer-elim-non-leaf\" \"no-infs-fp-math\"=\"false\" \"no-nans-fp-math\"=\"false\" \"stack-protector-buffer-size\"=\"8\" \"unsafe-fp-math\"=\"false\" \"use-soft-float\"=\"false\" }\n\
		\attributes #1 = { \"less-precise-fpmad\"=\"false\" \"no-frame-pointer-elim\"=\"true\" \"no-frame-pointer-elim-non-leaf\" \"no-infs-fp-math\"=\"false\" \"no-nans-fp-math\"=\"false\" \"stack-protector-buffer-size\"=\"8\" \"unsafe-fp-math\"=\"false\" \"use-soft-float\"=\"false\" }\n"
	(expid,final_str_defs,mainblock,terminate_id) = constructL l 0 (Map.fromList []) 2 (Map.fromList [])
	strblock = foldr (.) id (map (showString.strLine) (Map.toList final_str_defs))
	strLine (s,s_id) = "@.str"++(show s_id)++" = private unnamed_addr constant ["++(show.(+1).length$s)++" x i8] c\""++s++"\\00\", align 1\n"
	funcbody = mainblock . showString ("  %"++(show terminate_id)++" = call i32 @executeVExp(%struct.VExp* %"++(show expid)++")\n  ret i32 %"++(show terminate_id)++"\n}\n")
	constructL :: LExpr -> Int -> Map.Map [Char] Int -> Int -> Map.Map [Char] Int -> (Int,Map.Map [Char] Int,ShowS,Int)
	constructL l curlevel localdefs cur_id strdefs = case l of
		LInt v -> (cur_id,strdefs,showString ("  %"++(show cur_id)++" = call %struct.VExp* @makeInt(i32 "++(show v)++")\n"),cur_id+1)
		LDouble v -> (cur_id,strdefs,showString ("  %"++(show cur_id)++" = call %struct.VExp* @makeDouble(double "++(show v)++")\n"),cur_id+1)
		LRef key -> case (Map.member key localdefs) of
			True -> (cur_id,strdefs,showString ("  %"++(show cur_id)++" = call %struct.VExp* @makeRef(i32 "++(show (curlevel - (localdefs Map.! key) - 1))++")\n"),cur_id+1)
			False -> let
				new_strdefs = if (Map.member key strdefs) then strdefs else (Map.insert key (Map.size strdefs) strdefs)
				strid = (new_strdefs Map.! key)
				in (cur_id,new_strdefs,showString ("  %"++(show cur_id)++" = call %struct.VExp* @makeBuiltin(i8* getelementptr inbounds (["++(show.(+1).length$key)++" x i8]* @.str"++(show strid)++", i32 0, i32 0))\n"),cur_id+1)
		LAbs key body -> let
			(body_id,new_strdefs,bodystr,new_id) = constructL body (curlevel+1) (Map.insert key curlevel localdefs) cur_id strdefs in
			(new_id,new_strdefs,bodystr . showString ("  %"++(show new_id)++" = call %struct.VExp* @makeAbs(%struct.VExp* %"++(show body_id)++")\n"),new_id+1)
		LApply l1 l2 -> let
			(l1_id,strdefs_1,s1,id_1) = constructL l1 curlevel localdefs cur_id strdefs
			(l2_id,strdefs_2,s2,id_2) = constructL l2 curlevel localdefs id_1 strdefs_1
			in (id_2,strdefs_2,s1 . s2 . showString ("  %"++(show id_2)++" = call %struct.VExp* @makeApply(%struct.VExp* %"++(show l1_id)++", %struct.VExp* %"++(show l2_id)++")\n"),id_2+1)

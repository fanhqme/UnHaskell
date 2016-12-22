module ULambdaExpression where

data LExpr = LInt Int | LDouble Double | LRef [Char] | LAbs [Char] LExpr | LApply LExpr LExpr

instance Show LExpr where
	show = show' 0 where
		show' indent e = case e of
			LInt a -> show a
			LDouble a -> show a
			LRef a -> a
			LAbs a b -> "(\\"++a++" "++(show' (indent) b)++")"
			LApply a b -> "("++(show' (indent) a)++"\n"++(take indent (repeat ' '))++(show' (indent+1) b)++")"

defaultBuiltinNames = [
	"+",
	"-",
	"*",
	"/",
	"%",
	"toInt",
	"toFloat",
	"<",
	">=",
	">",
	"<=",
	"/=",
	"=",
	"exit",
	"openCmd",
	"close",
	"getChar",
	"getCharF",
	"peekChar",
	"peekCharF",
	"putChar",
	"putCharF",
	"getArg",
	"consFileName",
	"systemCmd"
	]

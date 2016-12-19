module ULambdaExpression where

data LExpr = LInt Int | LDouble Double | LRef [Char] | LAbs [Char] LExpr | LApply LExpr LExpr deriving Show

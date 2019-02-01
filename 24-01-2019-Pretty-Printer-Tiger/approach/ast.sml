(* The abstract syntax tree for expression *)
structure Ast = struct

datatype Expr  = Const of int
	       | Op    of Expr * BinOp * Expr
     and BinOp = Plus
	       | Minus
	       | Mul


(* Conversion to strings *)

fun binOpToString Plus  = "+"
  | binOpToString Minus = "-"
  | binOpToString Mul   = "*"

(* Some helper functions *)
fun plus  a b = Op (a, Plus, b)
fun minus a b = Op (a, Minus, b)
fun mul   a b = Op (a, Mul, b)


end

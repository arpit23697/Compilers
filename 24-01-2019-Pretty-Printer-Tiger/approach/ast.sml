(* The abstract syntax tree for expression *)
structure Ast = struct

datatype BinOp = Plus   
                | Minus
                | Mul

datatype Expr  = Const of string
	       | Op    of Expr * BinOp * Expr


datatype program_string = expression of Expr
                       |  IF_THEN of (Expr * Expr)



(* Conversion to strings *)

fun binOpToString Plus  = "+"
  | binOpToString Minus = "-"
  | binOpToString Mul   = "*"

(* Some helper functions *)
fun plus  a b = Op (a, Plus, b)
fun minus a b = Op (a, Minus, b)
fun mul   a b = Op (a, Mul, b)
fun if_then a b = IF_THEN (a , b)
fun expression_to_programString a = expression(a)


end

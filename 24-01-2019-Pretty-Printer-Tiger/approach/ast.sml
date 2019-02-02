(* The abstract syntax tree for expression *)
structure Ast = struct

datatype BinOp = Plus   
                | Minus
                | Mul

datatype Expr  = Const of string
	       | Op    of Expr * BinOp * Expr
         | Brackets of Expr


datatype condition = GT of (Expr * Expr)
                    | LT of (Expr * Expr)
                    | EQ of (Expr * Expr)

datatype program_string = expression of Expr
                       |  IF_THEN of (condition * Expr)



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
fun brackets a = Brackets (a)


fun greater a b = GT (a , b)
fun lesser a b = LT (a , b)
fun equal  a b = EQ (a , b)



end

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
                    | EQ_LT of (Expr * Expr)
                    | EQ_GT of (Expr * Expr)
                    | TRUE
                    | FALSE
                    | bracket_condition of (condition)

datatype iden = ID of string


datatype program_string = expression of Expr
                       | assignment of (iden * Expr)
                       |  IF_THEN of (condition * program_string)
                       | WHILE_DO of (condition * program_string)

(* Conversion to strings *)

fun binOpToString Plus  = "+"
  | binOpToString Minus = "-"
  | binOpToString Mul   = "*"

(* Some helper functions *)
fun plus  a b = Op (a, Plus, b)
fun minus a b = Op (a, Minus, b)
fun mul   a b = Op (a, Mul, b)
fun if_then a b = IF_THEN (a , b)
fun while_do a b = WHILE_DO (a , b)
fun expression_to_programString a = expression(a)
fun brackets a = Brackets (a)


fun greater a b = GT (a , b)
fun lesser a b = LT (a , b)
fun equal  a b = EQ (a , b)
fun equal_less a b = EQ_LT (a , b)
fun equal_greater a b = EQ_GT (a , b)
fun true_ () = TRUE
fun false_ () = FALSE
fun brackets_condition a = bracket_condition (a)




fun assign a b = assignment (a , b)
fun identify a = ID (a)


end

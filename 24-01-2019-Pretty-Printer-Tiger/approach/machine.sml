(*   
structure Machine =
struct

datatype Inst
  = Exec of Ast.BinOp
  | Push of int
  | ClearStack
  | PrintTop
  | PrintStack 


type Program = Inst list
fun instToString (Exec oper) = Ast.binOpToString oper
  | instToString (Push x   ) = Int.toString x
  | instToString ClearStack  = "c"
  | instToString PrintTop    = "p"
  | instToString PrintStack  = "s"

(* val programToString = String.concatWith " " o List.map instToString *)

end *)

structure Translate =
struct

fun compileExpr (Ast.Const x)         = print(Int.toString x)
  | compileExpr (Ast.Op (x, oper, y)) = (compileExpr x ;print(Ast.binOpToString oper) ; compileExpr y   ) 


fun compile []        = ()
  | compile (x :: xs) = (compileExpr x ; compile xs)

end
structure Translate =
struct

fun compileExpr (Ast.Const x)         = print(x)
  | compileExpr (Ast.Op (x, oper, y)) = (compileExpr x ;print(Ast.binOpToString oper) ; compileExpr y   ) 
  | compileExpr (Ast.IF_THEN (x , y)) = (print("IF \n\t") ; compileExpr x ; print("THEN \n\t") ; compileExpr y )

fun compile []        = ()
  | compile (x :: xs) = (compileExpr x ; compile xs)

end
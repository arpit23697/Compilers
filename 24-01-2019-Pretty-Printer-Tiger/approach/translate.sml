structure Translate =
struct

val indent = ref 0


(*This is for the indentation*)
(*This set of function is used for printing the indenation correctly*)
val n = ref 5
fun print_tabs () = if !n = 0 then ( print("")) else (n := !n - 1 ; print ("\t") ; print_tabs ());
fun print_tabs_real x = (n := x ; print_tabs () )



fun print_expression (Ast.Const x) = print(x)
    | print_expression (Ast.Op (x , oper , y)) = (print_expression x ; print(" " ^ Ast.binOpToString oper ^ " ") ; print_expression y)



fun compileExpr  (Ast.expression x) = print_expression x
    | compileExpr (Ast.IF_THEN (x , y)) = (print("IF\n")  ; print_tabs_real 1   ;
                                         print_expression x ; print("\nTHEN\n") ; print_tabs_real 1  ;
                                          print_expression y ; print("\n") )


fun compile []        = ()
  | compile (x :: xs) = (compileExpr x ; compile xs)

end
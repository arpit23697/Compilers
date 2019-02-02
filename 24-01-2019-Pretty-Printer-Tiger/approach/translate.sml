structure Translate =
struct

val indent = ref 0


(*This is for the indentation*)
(*This set of function is used for printing the indenation correctly*)
val n = ref 5
fun print_tabs () = if !n = 0 then ( print("")) else (n := !n - 1 ; print ("\t") ; print_tabs ());
fun print_tabs_real () = (n := !indent ; print_tabs () )




fun print_expression (Ast.Const x) = print(x)
    | print_expression (Ast.Op (x , oper , y)) = ( print_expression x ; print(" " ^ Ast.binOpToString oper ^ " ") ; print_expression y)
fun print_expression_indent x = (print_tabs_real () ; print_expression x)


fun print_condition (Ast.GT (x , y)) = (print_expression x ; print(" > ") ; print_expression y)
    | print_condition (Ast.LT (x , y)) = (print_expression x ; print(" < ") ; print_expression y)
    | print_condition (Ast.EQ (x , y)) = (print_expression x ; print(" = ") ; print_expression y)




fun compileExpr  (Ast.expression x) = print_expression_indent x
    | compileExpr (Ast.IF_THEN ( x , y)  ) = (print("IF (")  ; 
                                          print_condition x; print (" )") ;
                                          print("\nTHEN\n") ;
                                        indent := !indent + 1 ; print_expression_indent y; indent := !indent -1 ;
                                         print("\n") )


fun compile []        = ()
  | compile (x :: xs) = (compileExpr x ; compile xs)

end
structure Translate =
struct

val indent = ref 0


(*This is for the indentation*)
(*This set of function is used for printing the indenation correctly*)
val n = ref 5
fun print_tabs () = if !n = 0 then ( print("")) else (n := !n - 1 ; print ("\t") ; print_tabs ());
fun print_tabs_real () = (n := !indent ; print_tabs () )




fun print_expression (Ast.Const x) = print(x)
    | print_expression (Ast.Brackets x) = (print ("( ") ; print_expression x ; print(")"))
    | print_expression (Ast.Op (x , oper , y)) = ( print_expression x ; print(" " ^ Ast.binOpToString oper ^ " ") ; print_expression y)
fun print_expression_indent x = (print_tabs_real () ; print_expression x)


fun print_condition (Ast.GT (x , y)) = (print_expression x ; print(" > ") ; print_expression y)
    | print_condition (Ast.LT (x , y)) = (print_expression x ; print(" < ") ; print_expression y)
    | print_condition (Ast.EQ (x , y)) = (print_expression x ; print(" = ") ; print_expression y)
    | print_condition (Ast.EQ_LT (x , y)) = (print_expression x ; print(" <= ") ; print_expression y)
    | print_condition (Ast.EQ_GT (x , y)) = (print_expression x ; print(" >= ") ; print_expression y)
    | print_condition (Ast.TRUE ) = (print (" true "))
    | print_condition (Ast.FALSE) = (print (" false "))
    | print_condition (Ast.bracket_condition x) = (print("( ") ; print_condition x ; print(" )")) 

fun print_identifier (Ast.ID x) = print(x)


fun compileExpr  (Ast.expression x) = (print_expression_indent x ; print("\n"))
    | compileExpr (Ast.IF_THEN ( x , y)  ) = (print_tabs_real () ;   print("IF (")  ; 
                                          print_condition x ; print (" )") ; 
                                          print ("\n"); print_tabs_real () ;print("THEN\n") ;
                                          indent := !indent + 1; compileExpr y; indent := !indent -1 ;
                                         print("\n") )
    | compileExpr (Ast.assignment (x , y)) = ( print_tabs_real () ; print_identifier x ; print(" := ") ; print_expression y; print("\n") )


fun compile []        = ()
  | compile (x :: xs) = (compileExpr x ; compile xs)

end
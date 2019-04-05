structure codeGen = struct 

    (* Opening the file *)
    val fd = TextIO.openOut "out.js"    
    fun printS x= TextIO.output( fd,x )
    

    val indent = ref 0
    val n = ref 0
    fun print_tabs () = if !n = 0 then ( printS("")) else (n := !n - 1 ; printS ("\t") ; print_tabs ());
    fun print_tabs_real () = (n := !indent ; print_tabs () )
    (* =============================== main program ======================================= *)
fun compileProgram (Ast.declL(y,z,x)) = (  printDeclarationList x)

and  printDeclarationList ([x]) = (printDeclaration x)
    | printDeclarationList (x :: y) = (printDeclaration x ; printDeclarationList y)
    | printDeclarationList ([]) = ()

and printDeclaration (Ast.variableDeclaration (x)) = (printVarDeclaration x)
    | printDeclaration (Ast.functionDeclaration (x)) = (printFunDeclaration x)

and printVarDeclaration (Ast.vDecl(x,y)) = (print_tabs_real () ; printTypeSpecifier x ; printVarDeclList y ; printS ";\n")

and printVarDeclList ([x]) = (printVarDeclInitialize x)
    | printVarDeclList ( x :: y ) = (printVarDeclInitialize x ; printS " , " ; printVarDeclList y)
    | printVarDeclList ([]) = ()

and printVarDeclInitialize (Ast.declarationOnlyID (x)) = (printVarDeclID x)
    | printVarDeclInitialize (Ast.declarationAssignment (x,y)) = (printVarDeclID x ; printS " = " ; printSimpleExpression y)

and printVarDeclID (Ast.vID (x)) = (printS x)
    | printVarDeclID (Ast.arrayLike (x,y)) = (  
                                            printS x;
                                            printS " = new Array(";
                                            printS y;
                                            printS ")"
                                            )

and   printTypeSpecifier (Ast.integer) = (printS "var ")
    | printTypeSpecifier (Ast.boolean) = (printS "var ")
    | printTypeSpecifier (Ast.character) = (printS "var ")

and printFunDeclaration (Ast.functionReturn (x,y,z,w)) = (
                                                            printS "function ";
                                                            printS y ; printS " ";
                                                            printS "( ";
                                                            printParams z;
                                                            printS " )";
                                                            printCompoundStmt w
                                                         )

    | printFunDeclaration (Ast.functionVoid (y,z,w)) = (
                                                            printS "function ";
                                                            printS y ; printS " ";
                                                            printS "( ";
                                                            printParams z;
                                                            printS " )";
                                                            printCompoundStmt w
                                                         )  
and printParams ( [x] ) = (printParamType x)
    | printParams (x :: xs) = (printParamType x ; printS " , " ; printParams xs)
    | printParams ([]) = ()

and printParamType (Ast.parameter(x,y)) = (printParamID y)

and printParamID (Ast.normalID(x))   = (printS x ; printS " ")
    | printParamID (Ast.arrayID (x)) = (printS x ; printS " " )
             
and printStatement (Ast.eStatement(x)) = (print_tabs_real () ; printExpressionStmt x)
   | printStatement (Ast.cStatement(x)) = (print_tabs_real () ; printCompoundStmt x)
   | printStatement (Ast.sStatement(x)) = (print_tabs_real () ; printSelectionStmt x)
   | printStatement (Ast.iStatement(x)) = (print_tabs_real () ; printIterationStmt x)
   | printStatement (Ast.rStatement(x)) = (print_tabs_real () ; printReturnStmt x)
   | printStatement (Ast.bStatement(x)) = (print_tabs_real () ; printBreakStmt x)
   | printStatement (Ast.conStatement(x)) = (print_tabs_real () ; printContinueStmt x)
   | printStatement (Ast.printStatement(x)) = (print_tabs_real () ; printStmt x)


and printCompoundStmt (Ast.statementWithBrace (x,y)) = (
                                                        printS "{\n";
                                                        indent := !indent + 1;
                                                        printLocalDeclarations x;
                                                        printStatementList y;
                                                        print_tabs_real();
                                                        printS "}";
                                                        printS "\n";
                                                        indent := !indent - 1
                                                        ) 
and printLocalDeclarations (Ast.declIn(x,y)) = (
                                                printLocalDeclarations x;
                                                printVarDeclaration y
                                                )
    | printLocalDeclarations (Ast.emptyDeclIn ) = ()


and  printStatementList ( [] ) = ()
    |printStatementList ( x :: y ) = (printStatement x ; printStatementList y )


and printExpressionStmt (Ast.basicExpression (x)) = (printExpression x ; printS (";\n") ) 
    | printExpressionStmt (Ast.semicolon) = (printS (";\n") )

and printSelectionStmt (Ast.IF (x,y)) = (
                                            printS "if ";
                                            printS "(";
                                            printSimpleExpression x;
                                            printS " )";
                                            printStatement y
                                        )
    | printSelectionStmt (Ast.IF_ELSE (x,y,z)) = (
                                                    printS "if ";
                                                    printS "( ";
                                                    printSimpleExpression x;
                                                    printS " )";
                                                    printStatement y;
                                                    printS "else";
                                                    printStatement z
                                                )
and printIterationStmt (Ast.WHILE (x,y)) = (
                                                printS "while ";
                                                printS "( ";
                                                printSimpleExpression x;
                                                printS " )";
                                                printStatement y
                                           )
                                        
and printReturnStmt (Ast.returnNoValue ) = ( printS " return " ; printS ";\n")
    | printReturnStmt (Ast.returnValue (x)) = ( printS " return " ; printExpression x ; printS ";\n" )

and printBreakStmt (Ast.BREAK) = (printS "break ;\n") 
and printContinueStmt (Ast.CONTINUE) = (printS "continue ;\n")
and printStmt (Ast.printing (x)) = (printS "document.write( " ; printExpressionList x ; printS ");\n") 


and printExpressionList ([]) = ()
    | printExpressionList ([x]) = (printSimpleExpression x)
   | printExpressionList (x::xs) = ( printSimpleExpression x; printS "," ; printExpressionList xs )

and printExpression (Ast.assign (x, y)) = (printMutable x ; printS " = " ; printExpression y)
    | printExpression (Ast.assignPlus (x, y)) = (printMutable x ; printS " += " ; printExpression y)
    | printExpression (Ast.assignMinus (x, y)) = (printMutable x ; printS " -= " ; printExpression y)
    | printExpression (Ast.assignMult (x, y)) = (printMutable x ; printS " *= " ; printExpression y)
    | printExpression (Ast.assignDiv (x, y)) = (printMutable x ; printS " /= " ; printExpression y)
    | printExpression (Ast.increment (x)) = (printMutable x ; printS "++ ")
    | printExpression (Ast.decrement (x)) = (printMutable x ; printS "--") 
    | printExpression (Ast.plainExpression (x)) = (printSimpleExpression x)


and printSimpleExpression (Ast.or (x,y)) = (printSimpleExpression x ; printS " || " ; printAndExpression y)
    | printSimpleExpression (Ast.noOr(x)) = (printAndExpression x)

and printAndExpression (Ast.simpleAnd (x , y)) = ( printAndExpression x ; printS " && " ; printUnaryRelExpression y) 
    | printAndExpression (Ast.uExpr (x)) = (printUnaryRelExpression x)

and printUnaryRelExpression (Ast.not (x)) = (printS " !" ; printUnaryRelExpression x )
    | printUnaryRelExpression (Ast.rExpr (x)) = (printRelExpression x)

and printRelExpression (Ast.relExp (x,y,z)) = (printSumExpression x ; printRelop y; printSumExpression z)
    | printRelExpression (Ast.noRel (x)) = (printSumExpression x)


and printRelop (Ast.LTE) = printS" <= "
    | printRelop (Ast.LT) = printS" < "
    | printRelop (Ast.GTE) = printS" >= "
    | printRelop (Ast.GT) = printS" > "
    | printRelop (Ast.EQ) = printS" == "
    | printRelop (Ast.NEQ) = printS" != "

and printSumExpression (Ast.sumExp (x,y,z)) = (printSumExpression x ; printSumOp y; printTerm z )
    | printSumExpression (Ast.noSum (x)) = (printTerm x)

and printSumOp (Ast.PLUS) = printS " + "
    | printSumOp (Ast.MINUS) = printS " - "

and printTerm (Ast.multExp (x,y,z)) = (printTerm x ; printMulOp y;  printUnaryExpression z )
    | printTerm (Ast.noMult (x)) = (printUnaryExpression x)

and printMulOp (Ast.MULT) = printS " * "
    | printMulOp (Ast.DIV) = printS " / "
    | printMulOp (Ast.MOD) = printS " % "

and printUnaryExpression (Ast.uExp (x,y)) = (printUnaryOp x; printUnaryExpression y)
    | printUnaryExpression (Ast.noUnary (x)) = (printFactor x)
and printUnaryOp (Ast.DASH) = printS " - "

and printFactor (Ast.mut (x)) = (printMutable x)
    | printFactor (Ast.immut (x)) = (printImmutable x)


and printMutable (Ast.mID (x)) = (printS x)
    | printMutable (Ast.mArray (x,y)) = (printMutable x ; printS "["; printExpression y ; printS "]")

and printImmutable (Ast.paranthesis (x)) = (printS "( " ; printExpression x; printS " )")
    | printImmutable (Ast.c (x)) =         (printCall x) 
    | printImmutable (Ast.const (x)) = (printConstant x)

and printCall (Ast.callArgs (x , y)) = (printS x ; printS " (" ; printArgs y ; printS " )")
and printArgs ([x]) = (printExpression x )
    | printArgs (x :: xs) = (printExpression x ; printS "," ; printArgs xs)
    | printArgs ([]) = ()

and printConstant (Ast.number (x)) = (printS x)
    | printConstant (Ast.charConst (x)) = (printS x)
    | printConstant (Ast.trueValue ) = (printS "true")
    | printConstant (Ast.falseValue ) = (printS "false")

end
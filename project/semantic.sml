structure Semantic = struct 

    open printColor;


    (*This set of function is used for printing the indenation correctly*)
    val indent = ref 0
    val n = ref 0
    fun print_tabs () = if !n = 0 then ( print("")) else (n := !n - 1 ; print ("\t") ; print_tabs ());
    fun print_tabs_real () = (n := !indent ; print_tabs () )


    (* Declaring the required variables; the symbolTable and the symbolStack *)
    val mySymbolTable : (cType.ty Symbol.refTable) = ref IntBinaryMap.empty
    val mySymbolStack : Symbol.symbolStackType ref = ref Stack.empty

    (* helper  functions  *)
    (* Begins the scope *)
    fun beginScope () = let 
                        val (x , y) =  Symbol.beginScope( (!mySymbolTable) , (!mySymbolStack) ) 
                        in
                        (mySymbolTable := x ; mySymbolStack := y)
                        end

    (* Ends the scope *)
    fun endScope () = let 
                        val (x , y) =  Symbol.endScope( (!mySymbolTable) , (!mySymbolStack) ) 
                    in
                        (mySymbolTable := x ; mySymbolStack := y)
                    end

    (* Insert symbol *)
    (* Takes the string (which is the identifier) and the type as the input and then insert it in the table *)
    fun enter (s : string , t : cType.ty) = let 
                                            val tempSymb : Symbol.symbol = Symbol.symbol (s)
                                            val (x , y) =  Symbol.enter( (!mySymbolTable) , tempSymb, t ,(!mySymbolStack) ) 
                                            in
                                            (mySymbolTable := x ; mySymbolStack := y)
                                            end

    (* Takes the string as the input and returns true or false depending on wether it is in the table or not *)
    fun inTable (s:string) = let 
                        val tempSymb : Symbol.symbol = Symbol.symbol (s)
                        in 
                        Symbol.inTable ((!mySymbolTable) , tempSymb)
                        end

    (* Takes the string as the input and returns the type *)
    fun look (s:string) = let 
                        val tempSymb : Symbol.symbol = Symbol.symbol(s)
                        in 
                        Symbol.look ((!mySymbolTable) , tempSymb)
                        end

    (* Print the symbol, table and stack *)
    fun printAllSymbols () = (print "Symbols\n" ; Symbol.printAllSymbols())  
    fun printTable () = (print "Table\n" ; Symbol.printTable ((!mySymbolTable)) ; print "\n")
    fun printStack () = (print "Stack  "; Symbol.printStack ((!mySymbolStack)) ; print "\n")

    fun printDetails () = (
                        printAllSymbols();
                        printTable();
                        printStack()
                        )


    (* Testing helper functions *)
    (* val temp  = beginScope()
    val temp = enter("a" , cType.INT)
    val temp = enter("b" , cType.CHAR)
    val temp = enter("c" , cType.BOOL)


    val temp = printAllSymbols()
    val temp = printTable()
    val temp = printStack()

    val temp = beginScope()
    val temp = enter ("a" , cType.BOOL)

    val temp = printAllSymbols()
    val temp = printTable()
    val temp = printStack()

    val temp = endScope()
    val temp = endScope()
    val temp = printAllSymbols()
    val temp = printTable()
    val temp = printStack() *)
    
    (* Doing the semantic analysis *)
    (* Each of the function returns the type *)

    (* ========================== doing the semantic analysis *)
    fun semanticProgram (Ast.declL(x)) = (print "===================this is program==================\n" ; semanticDeclarationList x  )

    and semanticDeclarationList ([x] ) = semanticDeclaration x
        | semanticDeclarationList (x::y) = (semanticDeclaration x ; semanticDeclarationList y)
        | semanticDeclarationList ([]) = ()

    and semanticDeclaration (Ast.variableDeclaration (x)) = (beginScope();           (*this is the beginning of the scope of the variable*)
                                                            semanticVarDeclaration x)
    | semanticDeclaration (Ast.functionDeclaration (x)) = (
                                                            beginScope();
                                                            semanticFunDeclaration x;
                                                            printDetails();
                                                            endScope()
                                                        )

(* ======================== variable declaration =========================== *)
and semanticVarDeclaration (Ast.vDecl(x,y)) = (
                                            print_tabs_real () ; 
                                            semanticTypeSpecifier x ; 
                                            semanticVarDeclList (x,y) ;
                                            print ";\n"
                                            
                                            )

(* Takes the type of the decl list as the argument and put each one of them in the table *)
and semanticVarDeclList ( t , [x] ) = (semanticVarDeclInitialize (t, x) )
    | semanticVarDeclList ( t , (x :: y) ) = (semanticVarDeclInitialize (t,x) ; print " , " ; semanticVarDeclList (t,y) )
    | semanticVarDeclList (t, []) = ()


and semanticVarDeclInitialize (t, Ast.declarationOnlyID (x)) = (semanticVarDeclID (t,x) )
    | semanticVarDeclInitialize (t, Ast.declarationAssignment (x,y)) = (semanticVarDeclID (t,x) ; print_yellow " := " ; semanticSimpleExpression y)

(* Takes the id and the tpye *)
(* So insert this into the table and the stack as the part of the current scope *)
and semanticVarDeclID (t, Ast.vID (x)) = ( (case t of 
                                             Ast.integer => enter(x , cType.INT)  
                                            | Ast.boolean => enter (x , cType.BOOL)
                                            | Ast.character => enter (x, cType.CHAR)
                                            );
                                            print_default x  )

    | semanticVarDeclID (t, Ast.arrayLike (x,y)) = (
                                            (case t of 
                                             Ast.integer => enter(x , cType.ARRAY(cType.INT ))  
                                            | Ast.boolean => enter (x , cType.ARRAY(cType.BOOL))
                                            | Ast.character => enter (x, cType.ARRAY(cType.CHAR))
                                            );
                                            print_default x;
                                            print "[";
                                            print_default y;
                                            print "]"
                                            )

and   semanticTypeSpecifier (Ast.integer) = (print_cyan "int ")
    | semanticTypeSpecifier (Ast.boolean) = (print_cyan "bool ")
    | semanticTypeSpecifier (Ast.character) = (print_cyan "char ")

(* =========================== for the function ======================== *)

(* Each function marks the beginning of the scope and the end of the scope*)
and semanticFunDeclaration (Ast.functionReturn (x,y,z,w)) = 
                                                            let 
                                                            val typeList= getTypeList(z)
                                                            val retType = case x of 
                                                                        Ast.integer => cType.INT
                                                                        | Ast.boolean => cType.BOOL
                                                                        | Ast.character => cType.CHAR
                                                            val functionType = cType.FUNC(typeList , retType)
                                                            in 
                                                            (
                                                            
                                                            semanticTypeSpecifier x;
                                                            print "" ; print_magneta y ; print " ";
                                                            print "( ";
                                                            
                                                        
                                                            (* Inserting the type of the function *)
                                                            enter (y , functionType);
                                                            semanticParams z;
                                                            print " )";
                                                            semanticCompoundStmt w
                                                            
                                                    
                                                         )
                                                         end
    | semanticFunDeclaration (Ast.functionVoid (y,z,w)) = let 
                                                            val typeList= getTypeList(z)
                                                            val retType = cType.VOID
                                                            val functionType = cType.FUNC(typeList , retType)
                                                            in 
                                                            (
                                                            
                                                            print_red "void";
                                                            print "" ; print_magneta y ; print " ";
                                                            print "( ";
                                                            
                                                        
                                                            (* Inserting the type of the function *)
                                                            enter (y , functionType);
                                                            semanticParams z;
                                                            print " )";
                                                            semanticCompoundStmt w
                                                         )
                                                         end

and getTypeList (x) = (map getSingleType x)

and getSingleType (Ast.parameter (x,y)) = singleType (x , y)

and singleType (t , Ast.normalID(x) ) = (case t of 
                                             Ast.integer => cType.INT   
                                            | Ast.boolean => cType.BOOL
                                            | Ast.character => cType.CHAR
                                        )
    | singleType (t , Ast.arrayID(x) ) = (case t of 
                                          Ast.integer => cType.ARRAY(cType.INT )
                                            | Ast.boolean => cType.ARRAY(cType.BOOL)
                                            | Ast.character =>cType.ARRAY(cType.CHAR)
                                         )

and semanticParams ( [x] ) = (semanticParamType x)
    | semanticParams (x :: xs) = (semanticParamType x ; print " , " ; semanticParams xs)
    | semanticParams ([]) = ()

and semanticParamType (Ast.parameter(x,y)) = (
                                                
                                            semanticTypeSpecifier x ;
                                             semanticParamID (x,y) )

and semanticParamID (t , Ast.normalID(x))   = ((case t of 
                                             Ast.integer => enter(x , cType.INT )  
                                            | Ast.boolean => enter (x , cType.BOOL)
                                            | Ast.character => enter (x, cType.CHAR)
                                                );
                                            print_default x ;
                                            print " ")

    | semanticParamID (t, Ast.arrayID (x)) = ((case t of 
                                             Ast.integer => enter(x , cType.ARRAY(cType.INT ))  
                                            | Ast.boolean => enter (x , cType.ARRAY(cType.BOOL))
                                            | Ast.character => enter (x, cType.ARRAY(cType.CHAR))
                                            );
                                                print_default x ;
                                            print " [] " )

(* ============================= this is statement ====================*)
and semanticStatement (Ast.eStatement(x)) = (print_tabs_real () ; semanticExpressionStmt x)
   | semanticStatement (Ast.cStatement(x)) = (print_tabs_real () ; semanticCompoundStmt x)
   | semanticStatement (Ast.sStatement(x)) = (print_tabs_real () ; semanticSelectionStmt x)
   | semanticStatement (Ast.iStatement(x)) = (print_tabs_real () ; semanticIterationStmt x)
   | semanticStatement (Ast.rStatement(x)) = (print_tabs_real () ; semanticReturnStmt x)
   | semanticStatement (Ast.bStatement(x)) = (print_tabs_real () ; semanticBreakStmt x)
   | semanticStatement (Ast.conStatement(x)) = (print_tabs_real () ; semanticContinueStmt x)

and semanticCompoundStmt (Ast.statementWithBrace (x,y)) = (
                                                        print_yellow "{\n";
                                                        indent := !indent + 1;
                                                        semanticLocalDeclarations x;
                                                        semanticStatementList y;
                                                        print_tabs_real();
                                                        print_yellow "}";
                                                        print "\n";
                                                        indent := !indent - 1
                                                        ) 

and semanticLocalDeclarations (Ast.declIn(x,y)) = (
                                                semanticLocalDeclarations x;
                                                semanticVarDeclaration y
                                                )
    | semanticLocalDeclarations (Ast.emptyDeclIn ) = ()

and  semanticStatementList ( [] ) = ()
    |semanticStatementList ( x :: y ) = (semanticStatement x ; semanticStatementList y)
    

and semanticExpressionStmt (Ast.basicExpression (x)) = (semanticExpression x ; print ";\n") 
    | semanticExpressionStmt (Ast.semicolon) = (print ";\n")

and semanticSelectionStmt (Ast.IF (x,y)) = (
                                            beginScope();
                                            print_red "if ";
                                            print_yellow "(";
                                            semanticSimpleExpression x;
                                            print_yellow " )";
                                            semanticStatement y;
                                            endScope()
                                        )
    | semanticSelectionStmt (Ast.IF_ELSE (x,y,z)) = (
                                                    beginScope();
                                                        print_red "if ";
                                                        print_yellow "( ";
                                                        semanticSimpleExpression x;
                                                        print_yellow " )";
                                                        semanticStatement y;
                                                        print_tabs_real();
                                                    endScope();

                                                    beginScope();
                                                        print_red "else";
                                                        semanticStatement z;
                                                    endScope()
                                                )

and semanticIterationStmt (Ast.WHILE (x,y)) = (
                                                beginScope();
                                                print_red "while ";
                                                print_yellow "( ";
                                                semanticSimpleExpression x;
                                                print_yellow " )";
                                                semanticStatement y;
                                                endScope()
                                           )

and semanticReturnStmt (Ast.returnNoValue ) = (print_tabs_real () ; print_red " return " ; print_yellow ";\n")
    | semanticReturnStmt (Ast.returnValue (x)) = (print_tabs_real(); print_red " return " ; semanticExpression x ; print_yellow ";\n" )

and semanticBreakStmt (Ast.BREAK) = (print "break ;\n") 
and semanticContinueStmt (Ast.CONTINUE) = (print "continue ;\n")
 









and semanticSimpleExpression(x) = print "This is simple expression"
and semanticExpression (x) = print "Expression"
end



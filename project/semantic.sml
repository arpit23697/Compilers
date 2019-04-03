structure Semantic = struct 

    open printColor;


    (*This set of function is used for printing the indenation correctly*)
    val indent = ref 0
    val n = ref 0
    fun print_tabs () = if !n = 0 then ( print("")) else (n := !n - 1 ; print ("\t") ; print_tabs ());
    fun print_tabs_real () = (n := !indent ; print_tabs () )

    (* For raising the exception *)
    exception SEMANTICERROR

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
                                                            (* beginScope(); *)
                                                            semanticFunDeclaration x;
                                                            printDetails()
                                                            (* endScope() *)
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
                                                            beginScope();
                                                            semanticParams z;
                                                            print " )";
                                                            semanticCompoundStmt w;
                                                            endScope()
                                                    
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

                                                            beginScope();
                                                            semanticParams z;
                                                            print " )";
                                                            semanticCompoundStmt w;
                                                            endScope()
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
 
(* ================================ this is expression ===================================== *)
(* This part will also include the type checking *)
(* and semanticExpression (Ast.assign (x, y)) = (semanticMutable x ; print_yellow " = " ; semanticExpression y)
    | semanticExpression (Ast.assignPlus (x, y)) = (semanticMutable x ; print_yellow " += " ; semanticExpression y)
    | semanticExpression (Ast.assignMinus (x, y)) = (semanticMutable x ; print_yellow " -= " ; semanticExpression y)
    | semanticExpression (Ast.assignMult (x, y)) = (semanticMutable x ; print_yellow " *= " ; semanticExpression y)
    | semanticExpression (Ast.assignDiv (x, y)) = (semanticMutable x ; print_yellow " /= " ; semanticExpression y)
    | semanticExpression (Ast.increment (x)) = (semanticMutable x ; print_yellow "++ ")
    | semanticExpression (Ast.decrement (x)) = (semanticMutable x ; print_yellow "--") 
    | semanticExpression (Ast.plainExpression (x)) = (semanticSimpleExpression x) *)
and semanticExpression x = (typeExpression x ;  print "Simple expression")
and semanticSimpleExpression x = ( typeSimpleExpression x ; print "This is simple expression")
(* This section is related to the simple expression and returns the type of the simple expression *)
and   typeExpression (Ast.assign (x, y)) = (typeExpression y)
    | typeExpression (Ast.assignPlus (x, y)) = (typeExpression y)
    | typeExpression (Ast.assignMinus (x, y)) = (typeExpression y)
    | typeExpression (Ast.assignMult (x, y)) = (typeExpression y)
    | typeExpression (Ast.assignDiv (x, y)) = (typeExpression y)
    | typeExpression (Ast.increment (x)) = (cType.INT)
    | typeExpression (Ast.decrement (x)) = ( cType.INT ) 
    | typeExpression (Ast.plainExpression (x)) = ( typeSimpleExpression x)

and typeSimpleExpression (Ast.or(x,y)) = cType.BOOL
    | typeSimpleExpression (Ast.noOr(x)) = typeAndExpression x

and typeAndExpression (Ast.simpleAnd (x,y)) = cType.BOOL
    | typeAndExpression (Ast.uExpr(x)) = (typeUnaryRelExpression x)

and typeUnaryRelExpression (Ast.not(x)) = cType.BOOL
    | typeUnaryRelExpression (Ast.rExpr(x)) = typeRelExpression x


and typeRelExpression (Ast.relExp (x,y,z)) = cType.BOOL
    | typeRelExpression (Ast.noRel (x)) = ( typeSumExpression x )

and typeSumExpression (Ast.sumExp (x,y,z)) = cType.INT
    | typeSumExpression (Ast.noSum (x)) = (typeTerm x)

and typeTerm (Ast.multExp (x,y,z)) = ( cType.INT )
    | typeTerm (Ast.noMult (x)) = (typeUnaryExpression x)

and typeUnaryExpression (Ast.uExp (x,y)) = ( cType.INT )
    | typeUnaryExpression (Ast.noUnary (x)) = ( typeFactor x )


and typeFactor (Ast.mut (x)) = ( typeMutable x )
    | typeFactor (Ast.immut (x)) = (typeImmutable x)

(* Takes the string which is mutable, check if in the table ; if there return its type otherwise error *)
and typeMutable (Ast.mID (x)):cType.ty = if inTable(x) = true 
                                then 
                                (look(x))
                                else
                                (print ("Undeclared identifier : "^x ^" ") ; raise SEMANTICERROR)

    | typeMutable (Ast.mArray (x,y)) = ( case (typeMutable x)
                                    of (cType.ARRAY(cType.INT)) => cType.INT
                                    | (cType.ARRAY(cType.BOOL)) => cType.BOOL
                                    | (cType.ARRAY(cType.CHAR)) => cType.CHAR
                                    | x => x
                                    )


and typeImmutable (Ast.paranthesis (x)) = ( typeExpression x )
    | typeImmutable (Ast.c (x)) =         (typeCall x) 
    | typeImmutable (Ast.const (x)) = (typeConstant x)

and typeCall (Ast.callArgs (x , y)) = ( getFunctionReturnType (look(x)) )

(* and printArgs ([x]) = (printExpression x ) *)
    (* | printArgs (x :: xs) = (printExpression x ; print "," ; printArgs xs) *)
    (* | printArgs ([]) = () *)


and  typeConstant (Ast.number (x)) = ( cType.INT )
    | typeConstant (Ast.charConst (x)) = (cType.CHAR)
    | typeConstant (Ast.trueValue ) = (cType.BOOL)
    | typeConstant (Ast.falseValue ) = ( cType.BOOL )

(* and semanticSimpleExpression x= print "This is simple expression" *)
                            (* let 
                            val t1 = semanticSimpleExpression x ; 
                            val t2 = print_yellow " || " ;
                            val t3 = semanticAndExpression y;
                            in
                            (cType.BOOL)
                             end
    | semanticSimpleExpression (Ast.noOr(x))= (cType.INT) *)

(* and semanticAndExpression (Ast.simpleAnd (x , y)) = 
                            let  
                            val t1 = semanticAndExpression x ; 
                            val t2 = print_yellow " && " ;
                            val t3 = semanticUnaryRelExpression y
                            in
                            cType.BOOL
                            end
    | semanticAndExpression (Ast.uExpr (x)) = (semanticUnaryRelExpression x)

and semanticUnaryRelExpression (Ast.not (x)) = (
                            print_yellow " !" ;
                            semanticUnaryRelExpression x;
                            cType.BOOL )
    | semanticUnaryRelExpression (Ast.rExpr (x)) = (semanticRelExpression x)

and semanticRelExpression (Ast.relExp (x,y,z)) = (
                                semanticSumExpression x ;
                                semanticRelop y;
                                semanticSumExpression z;
                                cType.BOOL 
                                )
    | semanticRelExpression (Ast.noRel (x)) = (semanticSumExpression x)

and semanticRelop (Ast.LTE) = print_yellow " <= "
    | semanticRelop (Ast.LT) = print_yellow " < "
    | semanticRelop (Ast.GTE) = print_yellow " >= "
    | semanticRelop (Ast.GT) = print_yellow " > "
    | semanticRelop (Ast.EQ) = print_yellow " == "
    | semanticRelop (Ast.NEQ) = print_yellow " != "

and semanticSumExpression (Ast.sumExp (x,y,z)) = (
                                        semanticSumExpression x ; 
                                        semanticSumOp y;
                                         semanticTerm z;
                                         cType.INT )
    | semanticSumExpression (Ast.noSum (x)) = (semanticTerm x)

and semanticSumOp (Ast.PLUS) = print_yellow " + "
    | semanticSumOp (Ast.MINUS) = print_yellow " - "

and semanticTerm (Ast.multExp (x,y,z)) = 
                                    (semanticTerm x ;
                                     semanticMulOp y;
                                    semanticUnaryExpression z;
                                    cType.INT )
    | semanticTerm (Ast.noMult (x)) = (semanticUnaryExpression x)

and semanticMulOp (Ast.MULT) = print_yellow " * "
    | semanticMulOp (Ast.DIV) = print_yellow " / "
    | semanticMulOp (Ast.MOD) = print_yellow " % "

and semanticUnaryExpression (Ast.uExp (x,y)) = (
                                    semanticUnaryOp x;
                                     semanticUnaryExpression y;
                                     cType.INT)
    | semanticUnaryExpression (Ast.noUnary (x)) = (semanticFactor x)

and semanticUnaryOp (Ast.DASH) = print_yellow " ~ "

and semanticFactor (Ast.mut (x)) = (semanticMutable x )
    | semanticFactor (Ast.immut (x)) = (semanticImmutable x) *)

and semanticFactor x = (cType.INT)
and semanticUnaryExpression x = (cType.INT)
and semanticUnaryRelExpression x = (cType.INT)
and semanticSumExpression x = (cType.INT)
and semanticRelExpression x = (cType.INT)
and semanticAndExpression x = (cType.INT)
and semanticMutable x = (cType.INT)
and semanticImmutable x = (cType.INT)
and semanticCall x = (cType.INT)
and semanticArgs x = (cType.INT)
and semanticConstant x = (cType.INT)
(* and semanticMutable (Ast.mID (x)) = if inTable(x) = true
                                    then
                                    (    
                                    print x;
                                    look(x)
                                    )
                                    else
                                    (print_red "Error : undeclared identifier " ; cType.INT)


    | semanticMutable (Ast.mArray (x,y)) = 
                                    let
                                    val t = semanticMutable x
                                    in
                                        (print_yellow "["; semanticExpression y ; print_yellow "]" ; t)
                                    end

and semanticImmutable (Ast.paranthesis (x)) = 
                                                let 
                                                val t = "( "
                                                val t = semanticExpression x
                                                in
                                                 (print " )" ; t)
                                                end
    | semanticImmutable (Ast.c (x)) =         (semanticCall x) 
    | semanticImmutable (Ast.const (x)) = (semanticConstant x)

and semanticCall (Ast.callArgs (x , y)) =   if inTable(x) = true 
                                            then
                                            let 
                                                val typeList  = getFunctionArgTypeList ( look(x) )
                                                val retType:cType.ty = getFunctionReturnType (look(x))                                            
                                            in
                                                if (checkCall(typeList , y) = true)
                                                then
                                                (
                                                print x ; print " (" ; semanticArgs y ; print " )";
                                                retType
                                                )
                                                else
                                                (print "Error in calling the function : "; cType.INT )
                                            end
                                            else
                                                (print "No Such function : "; cType.INT)
and semanticArgs ([x]) = (semanticExpression x )
    | semanticArgs (x :: xs) = (semanticExpression x ; print "," ; semanticArgs xs)
    | semanticArgs ([]) = ()


and semanticConstant (Ast.number (x)) = (print_green x ; cType.INT)
    | semanticConstant (Ast.charConst (x)) = (print x ; cType.CHAR)
    | semanticConstant (Ast.trueValue ) = (print "true" ; cType.BOOL)
    | semanticConstant (Ast.falseValue ) = (print "false" ; cType.BOOL) *)

(* Takes the type and the expression and check wether valid or not *)
and checkTypeExpression (t  , x) = if (t = x) 
                                then
                                true
                                else 
                                false

and checkCall (t::tx , x::xs) = checkTypeExpression(  t ,(semanticExpression x) ) andalso checkCall(tx,xs)
    | checkCall ([] , [] ) = true
    | checkCall( _ , _ ) = false

and getFunctionArgTypeList (cType.FUNC(x,y)) = x 
    | getFunctionArgTypeList (x) = [x]
and getFunctionReturnType (cType.FUNC(x,y)) = y
    | getFunctionReturnType x = x

end



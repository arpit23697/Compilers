structure Semantic = struct 

    open printColor;


    (*This set of function is used for printing the indenation correctly*)
    val indent = ref 0
    val n = ref 0
    fun print_tabs () = if !n = 0 then ( print("")) else (n := !n - 1 ; print ("\t") ; print_tabs ());
    fun print_tabs_real () = (n := !indent ; print_tabs () )


    (* ===================== for the initialised variables ====================*)
    val initialisedVariables: bool IntBinaryMap.map ref = ref IntBinaryMap.empty

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
    fun enter (s : string , t : cType.ty , i : bool) = let 
                                            val tempSymb : Symbol.symbol = Symbol.symbol (s)
                                            val k = Symbol.value (Symbol.symbol (s))
                                            val (x , y) =  Symbol.enter( (!mySymbolTable) , tempSymb, t ,(!mySymbolStack) ) 
                                            in
                                            (mySymbolTable := x ; mySymbolStack := y ;
                                            initialisedVariables := IntBinaryMap.insert( (!initialisedVariables) , k , i) )
                                            end

    fun varInitialise (Ast.mID(x) ) = let 
                                    val k = Symbol.value(Symbol.symbol(x))
                                    in 
                                    (initialisedVariables := IntBinaryMap.insert( (!initialisedVariables) , k , true) )
                                    end
        | varInitialise (Ast.mArray(x,y)) = varInitialise x
    fun isInitialised (Ast.mID(x)) =  let 
                                    val k = Symbol.value(Symbol.symbol(x))
                                    in 
                                    IntBinaryMap.lookup( (!initialisedVariables) , k ) 
                                    end
        | isInitialised (Ast.mArray(x,y)) = isInitialised x 
                                    (* val k = Symbol.value(Symbol.symbol(x)) *)
                                    (* in  *)
                                    (* IntBinaryMap.lookup( (!initialisedVariables) , k )  *)
                                    (* end *)

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
    (* This function checks if there is a function of type main *)
    fun isMain () = if (inTable ("main") = true )
                    then 
                        let 
                        val t = look("main")
                        val retType = getFunctionReturnType (t)
                        val args = getFunctionArgTypeList(t)
                         in 
                            if ( (retType <> cType.INT = true)  orelse (List.null (args) = false) )
                            then 
                            (print_red "Function of type main not matching \n" ; raise SEMANTICERROR)
                            else
                            () 
                        end 

                    else 
                    (print_red "No Main function\n" ; raise SEMANTICERROR)

    and semanticProgram (Ast.declL(y,z,x)) = (print_red "=================== This is semantic Analysis ==================\n" ; 
                                        print_yellow y ; print "\n"; print_yellow z ; print "\n" ;
                                        semanticDeclarationList x;
                                        isMain();
                                        print_red "====================== Compiled successfully ======================\n"  )

    and semanticDeclarationList ([x] ) = semanticDeclaration x
        | semanticDeclarationList (x::y) = (semanticDeclaration x ; semanticDeclarationList y)
        | semanticDeclarationList ([]) = ()

    and semanticDeclaration (Ast.variableDeclaration (x)) = (beginScope();           (*this is the beginning of the scope of the variable*)
                                                            semanticVarDeclaration x)
    | semanticDeclaration (Ast.functionDeclaration (x)) = (
                                                            (* beginScope(); *)
                                                            semanticFunDeclaration x;
                                                            (* printDetails() *)
                                                            print "\n"
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

and getID (Ast.vID(x) ) = x
    | getID(Ast.arrayLike (x,y)) = x
and semanticVarDeclInitialize (t, Ast.declarationOnlyID (x)) = (semanticVarDeclID (t,x,false) )
    | semanticVarDeclInitialize (t, Ast.declarationAssignment (x,y)) = 
                                                                        let 
                                                                        val temp = semanticVarDeclID (t,x,true)
                                                                        val leftType = typeMutable (Ast.mID(getID(x)) )
                                                                        val rightType = typeSimpleExpression y
                                                                        in 
                                                                        if (leftType = rightType)
                                                                        then
                                                                        (
                                                                         print_yellow " = " ;
                                                                          semanticSimpleExpression y)
                                                                          else
                                                                          (print_red "Assignment type not compatible\n" ; raise SEMANTICERROR)
                                                                        end
(* Takes the id and the tpye *)
(* So insert this into the table and the stack as the part of the current scope *)
(* Assume the variable is always initialised *)
and semanticVarDeclID (t, Ast.vID (x) , i) = ( (case t of 
                                             Ast.integer => enter(x , cType.INT , i)  
                                            | Ast.boolean => enter (x , cType.BOOL , i)
                                            | Ast.character => enter (x, cType.CHAR , i)
                                            );
                                            print_default x  )

    | semanticVarDeclID (t, Ast.arrayLike (x,y) , i) = (
                                            
                                            (case t of 
                                             Ast.integer => enter(x , cType.ARRAY(cType.INT ) , true)  
                                            | Ast.boolean => enter (x , cType.ARRAY(cType.BOOL) , true )
                                            | Ast.character => enter (x, cType.ARRAY(cType.CHAR) , true)
                                            );

                                            print_default x;
                                            print "[";
                                            print_default y;
                                            print "]"
                                            )

and   semanticTypeSpecifier (Ast.integer) = (print_cyan "int ")
    | semanticTypeSpecifier (Ast.boolean) = (print_cyan "bool ")
    | semanticTypeSpecifier (Ast.character) = (print_cyan "string ")

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
                                                            enter (y , functionType , true);
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
                                                            
                                                            print_red "void ";
                                                            print "" ; print_magneta y ; print " ";
                                                            print "( ";
                                                            
                                                        
                                                            (* Inserting the type of the function *)
                                                            enter (y , functionType , true);

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
                                             Ast.integer => enter(x , cType.INT , true )  
                                            | Ast.boolean => enter (x , cType.BOOL , true)
                                            | Ast.character => enter (x, cType.CHAR , true)
                                                );
                                            print_default x ;
                                            print " ")

    | semanticParamID (t, Ast.arrayID (x)) = ((case t of 
                                             Ast.integer => enter(x , cType.ARRAY(cType.INT ) , true)  
                                            | Ast.boolean => enter (x , cType.ARRAY(cType.BOOL) , true)
                                            | Ast.character => enter (x, cType.ARRAY(cType.CHAR) , true)
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
   | semanticStatement (Ast.printStatement (x)) = (print_tabs_real() ; semanticPrintStmt x)

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

and semanticSelectionStmt (Ast.IF (x,y)) = let 
                                            val t = typeSimpleExpression x
                                            in
                                            if (t = cType.BOOL)
                                            then
                                            (
                                            beginScope();
                                            print_red "if ";
                                            print_yellow "(";
                                            semanticSimpleExpression x;
                                            print_yellow " )";
                                            semanticStatement y;
                                            endScope()
                                            )
                                            else 
                                            (print_red "Condition not of boolean type\n" ; raise SEMANTICERROR)
                                            end

    | semanticSelectionStmt (Ast.IF_ELSE (x,y,z)) = let 
                                                    val t = typeSimpleExpression x
                                                    in 
                                                    if (t = cType.BOOL)
                                                    then
                                                    (
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
                                                    else
                                                     (print_red "Condition not of boolean type\n" ; raise SEMANTICERROR)    
                                                    end 

and semanticIterationStmt (Ast.WHILE (x,y)) = let 
                                                val t = typeSimpleExpression x
                                                in
                                                if (t = cType.BOOL)
                                                then
                                                (
                                                beginScope();
                                                print_red "while ";
                                                print_yellow "( ";
                                                semanticSimpleExpression x;
                                                print_yellow " )";
                                                semanticStatement y;
                                                endScope()
                                                )
                                                else 
                                                 (print_red "Condition not of boolean type\n" ; raise SEMANTICERROR)
                                                 end

and semanticReturnStmt (Ast.returnNoValue ) = let 
                                              val t =  getMostRecentFunctionType()
                                              
                                            in 
                                                if (t = cType.VOID )
                                                then 
                                                (print_tabs_real () ; print_red " return " ; print_yellow ";\n")
                                                else 
                                                (print_red "Return type not matching\n" ; raise SEMANTICERROR)
                                            end  
    | semanticReturnStmt (Ast.returnValue (x)) = let 
                                              val t =  getMostRecentFunctionType()
                                              val t2 = typeExpression x
                                            in 
                                                if (t = t2)
                                                then 
                                                (print_tabs_real(); print_red " return " ; semanticExpression x ; print_yellow ";\n" )
                                                else 
                                                (print_red "Return type not matching\n" ; raise SEMANTICERROR)
                                            end
    

and semanticBreakStmt (Ast.BREAK) = (print "break ;\n") 
and semanticContinueStmt (Ast.CONTINUE) = (print "continue ;\n")

and semanticPrintStmt (Ast.printing (x)) = (print_red "cout " ; semanticExpressionList x ; print "\n") 
   
and semanticExpressionList ([]) = (print " ; ")
   | semanticExpressionList (x::xs) = (print_yellow " << " ; semanticSimpleExpression x ; semanticExpressionList xs )

 
(* ================================ this is expression ===================================== *)

and semanticExpression x = (typeExpression x ;  Translate.printExpression x )
and semanticSimpleExpression x = ( typeSimpleExpression x ; Translate.printSimpleExpression x )
(* This section is related to the simple expression and returns the type of the simple expression *)
and   typeExpression (Ast.assign (x, y)) =  let 
                                            val leftType =  typeMutable x;
                                            val rightType = typeExpression y;

                                            in 
                                                if (leftType <> rightType)
                                                then
                                                    (print_red "Left and right hand side not matching\n" ; raise SEMANTICERROR)
                                                else
                                                    ( varInitialise (x) ;  rightType)
                                            end 

    | typeExpression (Ast.assignPlus (x, y)) = let 
                                            val leftType =  typeMutable x;
                                            val rightType = typeExpression y;
                                            val iTemp = isInitialised x
                                            in 
                                        
                                            if (leftType = rightType andalso leftType = cType.INT )
                                            then
                                                (if iTemp = false 
                                                then 
                                                (print_red "Variable not initialised\n" ;  raise SEMANTICERROR)
                                                else 
                                                rightType)
                                            else
                                                (print_red "Left and right hand side not matching or (not integer)\n" ; raise SEMANTICERROR)
                                            
                                            end
    | typeExpression (Ast.assignMinus (x, y) ) = let 
                                            val leftType =  typeMutable x;
                                            val rightType = typeExpression y;
                                            val iTemp = isInitialised x
                                            in 
                                        
                                            if (leftType = rightType andalso leftType = cType.INT )
                                            then
                                                (if iTemp = false 
                                                then 
                                                (print_red "Variable not initialised\n" ;  raise SEMANTICERROR)
                                                else 
                                                rightType)
                                            else
                                                (print_red "Left and right hand side not matching or (not integer)\n" ; raise SEMANTICERROR)
                                            
                                            end
    | typeExpression (Ast.assignMult (x, y)) =let 
                                            val leftType =  typeMutable x;
                                            val rightType = typeExpression y;
                                            val iTemp = isInitialised x
                                            in 
                                        
                                            if (leftType = rightType andalso leftType = cType.INT )
                                            then
                                                (if iTemp = false 
                                                then 
                                                (print_red "Variable not initialised\n" ;  raise SEMANTICERROR)
                                                else 
                                                rightType)
                                            else
                                                (print_red "Left and right hand side not matching or (not integer)\n" ; raise SEMANTICERROR)
                                            
                                            end
    | typeExpression (Ast.assignDiv (x, y)) = let 
                                            val leftType =  typeMutable x;
                                            val rightType = typeExpression y;
                                            val iTemp = isInitialised x
                                            in 
                                        
                                            if (leftType = rightType andalso leftType = cType.INT )
                                            then
                                                (if iTemp = false 
                                                then 
                                                (print_red "Variable not initialised\n" ;  raise SEMANTICERROR)
                                                else 
                                                rightType)
                                            else
                                                (print_red "Left and right hand side not matching or (not integer)\n" ; raise SEMANTICERROR)
                                            
                                            end
    | typeExpression (Ast.increment (x)) = let 
                                          val leftType  = typeMutable x;
                                          val iTemp = isInitialised x
                                          in 
                                            if (leftType = cType.INT)
                                            then
                                                if (iTemp = false) 
                                                then
                                                (print_red "Variable not initialised\n" ;  raise SEMANTICERROR)
                                                else
                                                (leftType)
                                            else 
                                                (print_red "Incrementing value not integer\n" ; raise SEMANTICERROR)
                                          end
    | typeExpression (Ast.decrement (x)) =let 
                                          val leftType  = typeMutable x;
                                          val iTemp = isInitialised x
                                          in 
                                            if (leftType = cType.INT)
                                            then
                                                if (iTemp = false) 
                                                then
                                                (print_red "Variable not initialised\n" ;  raise SEMANTICERROR)
                                                else
                                                (leftType)
                                            else 
                                                (print_red "Incrementing value not integer\n" ; raise SEMANTICERROR)
                                          end 
    | typeExpression (Ast.plainExpression (x)) = ( typeSimpleExpression x)

and typeSimpleExpression (Ast.or(x,y)) = let 
                                        val leftType = typeSimpleExpression x
                                        val rightType = typeAndExpression y
                                        in 
                                        if (leftType = rightType andalso leftType = cType.BOOL)
                                        then
                                        (leftType)
                                        else
                                        (print_red "Expression not of boolean type\n" ; raise SEMANTICERROR)
                                        end
    | typeSimpleExpression (Ast.noOr(x)) = typeAndExpression x

and typeAndExpression (Ast.simpleAnd (x,y)) = let 
                                        val leftType = typeAndExpression x
                                        val rightType = typeUnaryRelExpression y
                                        in 
                                        if (leftType = rightType andalso leftType = cType.BOOL)
                                        then
                                        (leftType)
                                        else
                                        (print_red "Expression not of boolean type\n" ; raise SEMANTICERROR)
                                        end
    | typeAndExpression (Ast.uExpr(x)) = (typeUnaryRelExpression x)

and typeUnaryRelExpression (Ast.not(x)) = let 
                                        val leftType = typeUnaryRelExpression x
                                        in 
                                        if (leftType = cType.BOOL)
                                        then
                                        (leftType)
                                        else
                                        (print_red "Expression not of boolean type\n" ; raise SEMANTICERROR)
                                        end
    | typeUnaryRelExpression (Ast.rExpr(x)) = typeRelExpression x

(* For comparison type of both the entities must be same and none should be equal to boolean 
true > 2  is not valid
*)
and typeRelExpression (Ast.relExp (x,y,z)) = let 
                                        val leftType = typeSumExpression x
                                        val rightType = typeSumExpression z
                                        (* val temp = Translate.printRelop y *)
                                        in 
                                        if (leftType = rightType andalso leftType <> cType.BOOL)
                                        then
                                        (cType.BOOL)
                                        else
                                        (print_red "Expression type not compatible for comparison\n" ; raise SEMANTICERROR)
                                        end
    | typeRelExpression (Ast.noRel (x)) = ( typeSumExpression x )

(* Addition and subtraction only for integer values *)
and typeSumExpression (Ast.sumExp (x,y,z)) = let 
                                        val leftType = typeSumExpression x
                                        val rightType = typeTerm z
                                        (* val temp = Translate.printRelop y *)
                                        in 
                                        if (leftType = rightType andalso leftType = cType.INT)
                                        then
                                        (cType.INT)
                                        else
                                        (print_red "Expression type not compatible for addition\n" ; raise SEMANTICERROR)
                                        end
    | typeSumExpression (Ast.noSum (x)) = (typeTerm x)

and typeTerm (Ast.multExp (x,y,z)) = let 
                                        val leftType = typeTerm x
                                        val rightType = typeUnaryExpression z
                                        (* val temp = Translate.printRelop y *)
                                        in 
                                        if (leftType = rightType andalso leftType = cType.INT)
                                        then
                                        (cType.INT)
                                        else
                                        (print_red "Expression type not compatible for multipication\n" ; raise SEMANTICERROR)
                                        end
    | typeTerm (Ast.noMult (x)) = (typeUnaryExpression x)

and typeUnaryExpression (Ast.uExp (x,y)) = let 
                                        val leftType = typeUnaryExpression y
                                        in 
                                        if (leftType = cType.INT)
                                        then
                                        (leftType)
                                        else
                                        (print_red "Expression type not compatible for negation\n" ; raise SEMANTICERROR)
                                        end
    | typeUnaryExpression (Ast.noUnary (x)) = ( typeFactor x )


and typeFactor (Ast.mut (x)) = 
                                let 
                                val temp = typeMutable x
                                val iTemp = isInitialised x
                                in 
                                if (iTemp = true)
                                then 
                                    (temp)
                                else 
                                    (print_red "variable not Initialised\n" ; raise SEMANTICERROR) 
                                end
    | typeFactor (Ast.immut (x)) = (typeImmutable x)

(* Takes the string which is mutable, check if in the table ; if there return its type otherwise error *)
and typeMutable (Ast.mID (x)):cType.ty = if inTable(x) = true 
                                then 
                                (look(x))
                                else
                                (print_red ("Undeclared identifier : "^x ^" ") ; raise SEMANTICERROR)

    | typeMutable (Ast.mArray (x,y)) =  let 
                                        val t = typeExpression y 
                        
                                        in 
                                     if (t = cType.INT)
                                     then       
                                        ( case (typeMutable x)
                                        of (cType.ARRAY(cType.INT)) => cType.INT
                                        | (cType.ARRAY(cType.BOOL)) => cType.BOOL
                                        | (cType.ARRAY(cType.CHAR)) => cType.CHAR
                                        | x => (print_red "Type not of array type" ; raise SEMANTICERROR)
                                        )
                                    else
                                    (print_red ("non compatible expression for indexing\n") ; raise SEMANTICERROR)
                                        end
    


(* We have to check for the call *)
and typeImmutable (Ast.paranthesis (x)) = ( typeExpression x )
    | typeImmutable (Ast.c (x)) =         ( typeCall x) 
    | typeImmutable (Ast.const (x)) = ( typeConstant x)

and typeCall (Ast.callArgs (x , y)) = if inTable(x) = true 
                                            then
                                            let 
                                                val typeList  = getFunctionArgTypeList ( look(x) )
                                                val retType:cType.ty = getFunctionReturnType (look(x))                                            
                                            in
                                                if (checkCall(typeList , y) = true)
                                                then
                                                (retType )
                                                else
                                                (print_red ("Error in calling the function (Invalid arguments): " ^ x ^ "\n") ; raise SEMANTICERROR )
                                            end
                                            else
                                                (print_red ("No Such function : " ^ x ^ "\n") ; raise SEMANTICERROR )

(* and printArgs ([x]) = (printExpression x ) *)
    (* | printArgs (x :: xs) = (printExpression x ; print "," ; printArgs xs) *)
    (* | printArgs ([]) = () *)


and  typeConstant (Ast.number (x)) = ( cType.INT )
    | typeConstant (Ast.charConst (x)) = (cType.CHAR)
    | typeConstant (Ast.trueValue ) = (cType.BOOL)
    | typeConstant (Ast.falseValue ) = ( cType.BOOL )

and checkTypeExpression (t  , x) = if (t = x) 
                                then
                                true
                                else 
                                false

and checkCall (t::tx , x::xs) = checkTypeExpression(  t ,(typeExpression x) ) andalso checkCall(tx,xs)
    | checkCall ([] , [] ) = true
    | checkCall( _ , _ ) = false

and getFunctionArgTypeList (cType.FUNC(x,y)) = x 
    | getFunctionArgTypeList (x) = [x]
and getFunctionReturnType (cType.FUNC(x,y)) = y
    | getFunctionReturnType x = x

and  getMostRecentFunctionType () = let 
                                        val symbolList = Stack.listItems (!mySymbolStack) 
                                            fun f (x::xs) =
                                                        let 
                                                            val (s, t) = x 
                                                            (* val temp = print s *)
                                                            
                                                        in 

                                                        if (s <> "$$")
                                                        then   
                                                    
                                                            if (isFunctionType ( look(s) ) = true)
                                                            then 
                                                               (getFunctionReturnType ( look (s)))
                                                            else
                                                                (f (xs))
                                                            
                                                        else 
                                                            (f (xs))
                                                        end

                                             | f (_) = (print_red "No function type" ; raise SEMANTICERROR)
                                        in 
                                            ( f symbolList)
                                        end 
    and isFunctionType (cType.FUNC(x,y)) = true 
        | isFunctionType (_) = false
end



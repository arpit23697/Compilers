structure Ast = struct 

datatype program = declL of  string * string * declaration list
        
    and declaration = variableDeclaration of varDeclaration 
                    | functionDeclaration of  funDeclaration
  
    (* =============================== variable declaration =============================== *)
    and varDeclaration = vDecl of (typeSpecifier * (varDeclInitialize list) ) 

    and varDeclInitialize = declarationOnlyID of varDeclID
                        | declarationAssignment of (varDeclID * simpleExpression)    (*Of the form valDeclID : simpleExpression*)
                                                                            (*Second one is like assignment on declarations*)

    and varDeclID = vID of string                          (*this is declaration of the form ID*)
                    | arrayLike of (string * string)     (*declaration of the form ID [NUMCONST] //like that of array*)

    and typeSpecifier = integer
                            | boolean 
                            | character

    (* ========================================= function declaration ================================ *)
    and funDeclaration = functionReturn of (typeSpecifier * string * paramType list * compoundStmt)       (* typeSpecifier ID (params) statement  // string is for the ID*)
                        | functionVoid of (string * paramType list * compoundStmt)           (* string is for the ID ; void ID (params) statement *)

    and paramType = parameter of (typeSpecifier * paramID) 

    and paramID = normalID of string                (*id of the type : ID*)
                 | arrayID of string                (*id of the type : ID[]*)


    (*============================================ for the statement ============================*)
    and statement = eStatement of expressionStmt
                    | cStatement of compoundStmt
                    | sStatement of selectionStmt
                    | iStatement of iterationStmt
                    | rStatement of returnStmt
                    | bStatement of breakStmt
                    | conStatement of continueStmt
                    | printStatement of printStmt

    and compoundStmt = statementWithBrace of (localDeclarations * statement list)       (*{localDeclaration statementList}*)
    
    and localDeclarations = declIn of (localDeclarations *varDeclaration)
                            | emptyDeclIn

    and expressionStmt = basicExpression of (expression)            (*for the type -- expression ;*) 
                        | semicolon                                 (*statement of the form ;*)

    and selectionStmt = IF of  (simpleExpression * statement)         (*if (simpleExression) statment*)
                        | IF_ELSE of (simpleExpression * statement * statement)   (*if (simpleExpression) statement else statement*)

    and iterationStmt = WHILE of (simpleExpression * statement)                                     (*while (simpleExpression) statement*)
                        (* | FOR of (expressionStmt * simpleExpression * expression * statement)    for (expressionStmt expressionStmt simpleExpression) statement *)
    
    and returnStmt = returnNoValue                                (*return ;*)                     
                    | returnValue of (expression)                 (*return expression;*)

    and breakStmt = BREAK                                       (*break ;*)
    and continueStmt = CONTINUE                                 (*continue ;*)

    and printStmt = printing of (simpleExpression list)

    (* ===================================== for the expression ================================== *)
    and expression = assign of (mutable * expression)
                    | assignPlus of (mutable * expression)
                    | assignMinus of (mutable * expression)
                    | assignMult of (mutable * expression)
                    | assignDiv of (mutable * expression)
                    | increment of mutable           (*mutable++*)
                    | decrement of mutable           (*mutable--*)
                    | plainExpression of simpleExpression

    and simpleExpression = or of (simpleExpression * andExpression)   (*simpleExpression or andExpression*)
                        | noOr of andExpression

    and andExpression = simpleAnd of (andExpression * unaryRelExpression)
                        | uExpr of unaryRelExpression

    and unaryRelExpression = not of unaryRelExpression   (* not unaryRelExression*)
                        | rExpr of relExpression 

    and relExpression = relExp of (sumExpression * relop * sumExpression)
                        | noRel of (sumExpression)

    and relop = LTE | LT | GTE | GT | EQ | NEQ

    and sumExpression = sumExp of (sumExpression * sumOp * term)
                        | noSum of (term)

    and sumOp = PLUS | MINUS 

    and term = multExp of (term * mulOp * unaryExpression )
                | noMult of unaryExpression
            
    and mulOp = MULT | DIV | MOD

    and unaryExpression = uExp of (unaryOp * unaryExpression)
                        | noUnary of (factor)

    and unaryOp = DASH 

    and factor = mut of (mutable)
                | immut of (immutable)

    and mutable = mID of string 
                | mArray of (mutable * expression)              (*mutable [expression]*)
                (* | mRecord of (mutable * string )                mutable.ID *)

    and immutable = paranthesis of expression                   (*(expression)*)
                    | c of call
                    | const of constant 

    and call = callArgs of (string * expression list)                      (*of the form ID (args)*)

    and constant = number of string
                    | charConst of string 
                    | trueValue
                    | falseValue

end
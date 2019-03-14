structure Ast = struct 
(* Put the keywords in the upper case letter *)
(* These are the keywords
record


 *)



datatype program = declL of  declarationList
    
    and declarationList =  declList of (declarationList * declaration)   (*This is simply a list of declarations*)
                        | singleDecl of declaration
    
    and declaration = variableDeclaration of varDeclaration 
                    | functionDeclaration of  funDeclaration
                    | recordDeclaration of recDeclaration

    (* ============================== record declaration ================================= *)

    and recDeclaration = recordID of (string * localDeclarations)     (*string is for the ID ; record ID { local Declarations }*)

    (* =============================== variable declaration =============================== *)
    and varDeclaration = vDecl of (typeSpecifier * varDeclList) 

    and scopedVarDeclaration = sDecl of (scopedTypeSpecifier * varDeclList )  

    and varDeclList = vList of (varDeclList * varDeclInitialize)  (*varDeclList is a list of varDeclInitialize*)
                    | vSingleDecl of varDeclInitialize

    and varDeclInitialize = declarationOnlyID of varDeclID
                        | declarationAssignment of (varDeclID * simpleExpression)    (*Of the form valDeclID : simpleExpression*)
                                                                            (*Second one is like assignment on declarations*)

    and varDeclID = vID of string                          (*this is declaration of the form ID*)
                    | arrayLike of (string * string)     (*declaration of the form ID [NUMCONST] //like that of array*)
        
    and scopedTypeSpecifier = staticType of typeSpecifier  (*Of the form static typeSpecifier*)
                            | simpleType of typeSpecifier

    and typeSpecifier = ret of returnTypeSpecifier        (*one type is not understood properly*)

    and returnTypeSpecifier = integer
                            | boolean 
                            | character

    (* ========================================= function declaration ================================ *)
    and funDeclaration = functionReturn of (typeSpecifier * string * params * statement)       (* typeSpecifier ID (params) statement  // string is for the ID*)
                        | functionVoid of (string * params * statement)           (* string is for the ID ; void ID (params) statement *)

    and params = parameterList of paramList 
                | emptyParameter   (*for the empty parameter*)
    
    and paramList = pList of (paramList * paramTypeList)           (*paramList is the list of paramTypeList*)
                    | singleParam of (paramTypeList)
    
    and paramTypeList = parameter of (typeSpecifier * paramIDList) 

    and paramIDList = listOfID of (paramIDList * paramID) 
                    | singleIDParameter of (paramID)

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

    and compoundStmt = statementWithBrace of (localDeclarations * statementList)       (*{localDeclaration statementList}*)
    
    and localDeclarations = declIn of (localDeclarations * scopedVarDeclaration)
                            | emptyDeclIn

    and statementList = listOfStatements of (statementList * statement)
                        | emptyListStatement 

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

    and unaryOp = STAR | DASH | QUES

    and factor = mut of (mutable)
                | immut of (immutable)

    and mutable = mID of string 
                | mArray of (mutable * expression)              (*mutable [expression]*)
                | mRecord of (mutable * string )                (*mutable.ID*)

    and immutable = paranthesis of expression                   (*(expression)*)
                    | c of call
                    | const of constant 

    and call = callArgs of (string * args)                      (*of the form ID (args)*)

    and args = aList of argList
                | emptyArg

    and argList = aaList of (argList * expression)
                | oneArg of (expression)

    and constant = number of string
                    | charConst of string 
                    | trueValue
                    | falseValue
 
 
end
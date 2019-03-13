structure Ast = struct 
(* Put the keywords in the upper case letter *)
(* These are the keywords
record


 *)



datatype program = declarationList
    
    and declarationList =  declList of (declarationList * declaration)   (*This is simply a list of declarations*)
                        | singleDecl of declaration
    
    and declaration = variableDeclaration of varDeclaration 
                    | functionDeclaration of  funDeclaration
                    | recordDeclaration of recDeclaraion

    (* ============================== record declaration ================================= *)

    and recDeclaraion = recordID of (string * localDeclarations)     (*string is for the ID ; record ID { local Declarations }*)

    (* =============================== variable declaration =============================== *)
    and varDeclaration = vDecl of (typeSpecifier * varDecList) 

    and scopedVarDeclaration = sDecl of (scopedTypeSpecifier * varDecList )  

    and varDecList = vList of (varDecList * varDeclInitialize)  (*varDeclList is a list of varDeclInitialize*)
                    | vSingleDecl of varDeclInitialize

    and varDeclInitialize = declarationOnlyID of varDeclID
                        | declarationAssignment of (varDeclID * simpleExpression)    (*Of the form valDeclID : simpleExpression*)
                                                                            (*Second one is like assignment on declarations*)

    and varDeclID = ID of string                          (*this is declaration of the form ID*)
                    | arrayLike of (string * numConst)     (*declaration of the form ID [NUMCONST] //like that of array*)
        
    and scopedTypeSpecifier = staticType of typeSpecifier  (*Of the form static typeSpecifier*)
                            | simpleType of typeSpecifier

    and typeSpecifier = ret of returnTypeSpecifier        (*one type is not understood properly*)

    and returnTypeSpecifier = integer of int
                            | boolean of bool 
                            | character of string

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

    and iterationStmt = WHILE of (simpleExpression * statement)        (*while (simpleExpression) statement*)
    
    and returnStmt = returnNoValue                                (*return ;*)                     
                    | returnValue of (expression)                 (*return expression;*)

    and breakStmt = BREAK                                       (*break ;*)
    and continueStmt = CONTINUE                                 (*continue ;*)

    (* ===================================== for the expression ================================== *)
    and expression = assign of (mutable * expression)
                    | assignPlus of (mutable * expression)
                    | assignMinus of (mutable * exression)
                    | assignMult of (mutable * exression)
                    | assignDiv of (mutable * expression)
                    | increment of mutable           (*mutable++*)
                    | decrement of mutable           (*mutable--*)
                    | plainExpression of simpleExpression

    and simpleExpression = or of (simpleExpression * andExpression)   (*simpleExpression or andExpression*)
                        | noOr of andExpression

    and andExpression = simleAnd of (andExpression * unaryRelExpression)
                        | uExpr of unaryRelExpression

    and unaryRelExpression = not of unaryRelExpression   (* not unaryRelExression*)
                        | rExpr of relExpression 

    and 

end
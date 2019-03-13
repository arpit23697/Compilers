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
    


end
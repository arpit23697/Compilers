structure Semantic = struct 

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

    (* fun semanticProgram (Ast.declL(x)) = semanticDeclarationList x

    and semanticDeclarationList (Ast.declList (x,y)) =  *)
fun semanticProgram x= "Doing semantic analyis"





end
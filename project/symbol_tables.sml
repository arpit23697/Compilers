structure Symbol  =
struct
    type symbol = string * int
    exception Symbol

    val nextsym = ref 0
    (* this is the hash table *)
    val hashtable : (string , int) HashTable.hash_table =HashTable.mkTable( HashString.hashString, op = ) (128,Symbol)
    
    (* Takes the input as the string and checks if in the hashtable 
    If in the hashtable then uses the same symbol
    If not then assign the new symbol to the string *)
    fun symbol name = case HashTable.find hashtable name 
                    of SOME i => (name,i)
                    | NONE => let val i = !nextsym
                        in nextsym := i+1;
                        HashTable.insert hashtable (name,i);
                        (name, i)
                    end

    (* Takes the symbol and then gives the corresponding string *)
    fun name ((s,n):symbol) = s
    fun value ((s,n):symbol) = n

    type 'a table= 'a list IntBinaryMap.map
    type 'a refTable = 'a list IntBinaryMap.map ref 
    type symbolStackType = symbol Stack.stack

    (* Creating the special markup symbol *)
    val markup:symbol = symbol ("$$")
    (* Creating the stack for the begin and end scope *)
    (* Note this stack will only contain the symbols and not the associated bindings *)
    (* val symbolStack : symbolStackType ref =ref Stack.empty *)



    val empty = IntBinaryMap.empty 


    (* 'a table is a map; (s,n) is the key ; a is the value *)
    (* When we are entering then we will also push the symbol on the stack *)
    fun enter(t: 'a table , (s,n): symbol , a: 'a , st : symbolStackType) = 
                                                    (
                                                    (* symbolStack := Stack.push ( (s,n) ,(!symbolStack) ); *)
                                                    if IntBinaryMap.inDomain (t , n) = true 
                                                    then
                                                        let 
                                                        val old = IntBinaryMap.lookup (t , n)
                                                        val new = a :: old
                                                        val temp:symbol = (s,n)
                                                        val newStack = Stack.push (temp , st)
                                                        in 
                                                        ( IntBinaryMap.insert(t , n , new) , newStack)
                                                        end
                                                    else  
                                                    (   let 
                                                        val temp : symbol = (s,n)
                                                        val newStack = Stack.push (temp , st)
                                                        in
                                                        ( IntBinaryMap.insert(t , n, [a]) , newStack) 
                                                        end
                                                    )
                                                    )

    fun look(t: 'a table, (s,n): symbol) = let 
                                            val x = IntBinaryMap.lookup(t,n)
                                            in
                                            List.hd (x)
                                            end

    fun remove (t : 'a table , (s,n): symbol , st:symbolStackType) = 
                                                if IntBinaryMap.inDomain(t , n) = true 
                                                then
                                                (* if in the table then also pop from the stack *)
                                                
                                                    let
                                                    val old = IntBinaryMap.lookup (t , n)
                                                    val new = List.tl old
                                                    (* val tempSymbol:symbol = (s,n) *)
                                                    val newStack = Stack.pop (st) 
                                                    in
                                                        if ( (List.null new) = true)
                                                        then
                                                            let 
                                                            val (temp,_) = IntBinaryMap.remove(t , n)
                                                            in 
                                                            ( temp , newStack )
                                                            end
                                                        else
                                                        ( IntBinaryMap.insert(t , n , new) , newStack)
                                                    end
                                            
                                                else
                                                    (t , st)

    (* for the scoping *)
    fun beginScope (t : 'a table , st : symbolStackType) = 
                                                        let 
                                                        val newStack = Stack.push (markup , st)
                                                        in
                                                        (t , newStack)
                                                        end

    (* pop till the marker is reached *)
    fun endScope (t : 'a table , st : symbolStackType) = if ( value(Stack.top ( st ) ) <> value(markup) )
                      then
                      let 
                        val s = Stack.top ( st )
                        val (newTable , newStack) = remove (t , s , st)
                      in
                        endScope(newTable , newStack)
                      end
                      else
                      (* pop the markup *)
                      let 
                        val newStack = Stack.pop (st)
                      in 
                        (t , newStack)
                      end





    (* This is for the printing functions *)
    fun printSymbols ((s,n):symbol) = (print s ; print " " ; print( Int.toString  n) ; print "\n" )

    fun printAllSymbols () = map printSymbols (HashTable.listItemsi hashtable)         

    fun printTypes x = (cType.printTypes x ;  print " ")
    fun printTable s = let 
                        fun f (x,y)= (print ( Int.toString x) ; print " --> " ; (map printTypes y) ; print "\n" ) 
                        in 
                        map f (IntBinaryMap.listItemsi s) 
                        end

    fun printStack (s) = map printSymbols (Stack.listItems s )

end

(* This is to take the symbol and print it *)
val s1 : Symbol.symbol = Symbol.symbol ("a")
val s2 : Symbol.symbol = Symbol.symbol ("b")
val s3 : Symbol.symbol = Symbol.symbol ("c")
val t = Symbol.printAllSymbols()


(* creating the table *)
val myTable : (cType.ty Symbol.refTable) = ref IntBinaryMap.empty
val mySymbolStack : Symbol.symbolStackType ref = ref Stack.empty


(* val temp = ( (myTable , mySymbolStack)  := Symbol.beginScope ((!myTable) , (!mySymbolStack) ) ) *)
(* For the begin of the scope *)
val temp = let 
           val (x , y) =  Symbol.beginScope( (!myTable) , (!mySymbolStack) ) 
            in
            (myTable := x ; mySymbolStack := y)
            end

val temp = (print "symbols  " ; Symbol.printAllSymbols() )
val temp = (print "Table  " ; Symbol.printTable ((!myTable)) ; print "\n")
val temp = (print "Stack  "; Symbol.printStack ((!mySymbolStack)) ; print "\n")
(* Inserting the values *)
val temp = let 
           val (x , y) =  Symbol.enter( (!myTable) , s1, cType.INT ,(!mySymbolStack) ) 
            in
            (myTable := x ; mySymbolStack := y)
            end

val temp = let 
           val (x , y) =  Symbol.enter( (!myTable) , s2, cType.BOOL ,(!mySymbolStack) ) 
            in
            (myTable := x ; mySymbolStack := y)
            end

val temp = let 
           val (x , y) =  Symbol.enter( (!myTable) , s3, cType.CHAR ,(!mySymbolStack) ) 
            in
            (myTable := x ; mySymbolStack := y)
            end
(* After first scope *)
val temp = print "============== After first scope ===============\n"
val temp = (print "symbols  " ; Symbol.printAllSymbols() )
val temp = (print "Table  " ; Symbol.printTable ((!myTable)) ; print "\n")
val temp = (print "Stack  "; Symbol.printStack ((!mySymbolStack)) ; print "\n")
(* Starting other scope *)
val temp = let 
           val (x , y) =  Symbol.beginScope( (!myTable) , (!mySymbolStack) ) 
            in
            (myTable := x ; mySymbolStack := y)
            end

val temp = print "============== other scope ===============\n"
val temp = (print "symbols  " ; Symbol.printAllSymbols() )
val temp = (print "Table  " ; Symbol.printTable ((!myTable)) ; print "\n")
val temp = (print "Stack  "; Symbol.printStack ((!mySymbolStack)) ; print "\n")
(* Inserting another value *)
val temp = let 
           val (x , y) =  Symbol.enter( (!myTable) , s1, cType.CHAR ,(!mySymbolStack) ) 
            in
            (myTable := x ; mySymbolStack := y)
            end

val temp = print "============== After Second scope ===============\n"
val temp = (print "symbols  " ; Symbol.printAllSymbols() )
val temp = (print "Table  " ; Symbol.printTable ((!myTable)) ; print "\n")
val temp = (print "Stack  "; Symbol.printStack ((!mySymbolStack)) ; print "\n")

val temp = cType.printTypes ( Symbol.look ( (!myTable) , s1 ))

(* End the scope *)
val temp = let 
           val (x , y) =  Symbol.endScope( (!myTable) , (!mySymbolStack) ) 
            in
            (myTable := x ; mySymbolStack := y)
            end


val temp = print "============== End of  first scope ===============\n"
val temp = (print "symbols  " ; Symbol.printAllSymbols() )
val temp = (print "Table  " ; Symbol.printTable ((!myTable)) ; print "\n")
val temp = (print "Stack  "; Symbol.printStack ((!mySymbolStack)) ; print "\n")

val temp = let 
           val (x , y) =  Symbol.endScope( (!myTable) , (!mySymbolStack) ) 
            in
            (myTable := x ; mySymbolStack := y)
            end
val temp = print "============== End of second scope ===============\n"
val temp = (print "symbols  " ; Symbol.printAllSymbols() )
val temp = (print "Table  " ; Symbol.printTable ((!myTable)) ; print "\n")
val temp = (print "Stack  "; Symbol.printStack ((!mySymbolStack)) ; print "\n")
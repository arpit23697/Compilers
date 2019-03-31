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

    val empty = IntBinaryMap.empty 


    (* 'a table is a map; (s,n) is the key ; a is the value *)
    fun enter(t: 'a table, (s,n): symbol, a: 'a):'a table = if IntBinaryMap.inDomain (t , n) = true 
                                                    then
                                                        let 
                                                        val old = IntBinaryMap.lookup (t , n)
                                                        val new = a :: old
                                                        in 
                                                        IntBinaryMap.insert(t , n , new)
                                                        end
                                                    else  
                                                    IntBinaryMap.insert(t , n, [a])

    fun look(t: 'a table, (s,n): symbol) = let 
                                            val x = IntBinaryMap.lookup(t,n)
                                            in
                                            List.hd (x)
                                            end

    fun remove (t : 'a table , (s,n): symbol) = if IntBinaryMap.inDomain(t , n) = true 
                                                then
                                                let
                                                val old = IntBinaryMap.lookup (t , n)
                                                val new = List.tl old
                                                in
                                                    if ( (List.null new) = true)
                                                    then
                                                        let 
                                                        val (temp,_) = IntBinaryMap.remove(t , n)
                                                        in 
                                                        (temp)
                                                        end
                                                    else
                                                    IntBinaryMap.insert(t , n , new)
                                                end
                                                else
                                                    (t)


    (* This is for the printing functions *)
    fun printSymbols ((s,n):symbol) = (print s ; print " " ; print( Int.toString  n) ; print "\n" )

    fun printAllSymbols () = map printSymbols (HashTable.listItemsi hashtable)         

    fun printTypes x = (cType.printTypes x ;  print " ")
    fun printTable s = let 
                        fun f (x,y)= (print ( Int.toString x) ; print " --> " ; (map printTypes y) ; print "\n" ) 
                        in 
                        map f (IntBinaryMap.listItemsi s) 
                        end

end

(* This is to take the symbol and print it *)
val s1 : Symbol.symbol = Symbol.symbol ("a")
val s2 : Symbol.symbol = Symbol.symbol ("b")
val s3 : Symbol.symbol = Symbol.symbol ("c")
val t = Symbol.printAllSymbols()


(* creating the table *)
val myTable : (cType.ty Symbol.refTable) = ref IntBinaryMap.empty
val temp = (myTable := Symbol.enter ((!myTable) , s1 , cType.INT ))
val temp = (myTable := Symbol.enter ((!myTable) , s2 , cType.BOOL ))
val temp = (myTable := Symbol.enter ((!myTable) , s3 , cType.ARRAY (cType.INT) ))
val t = Symbol.printTable (!myTable)
(*  *)
(*  *)
val temp = (myTable := Symbol.enter ((!myTable) , s1 , cType.BOOL ))

val t = print "=============\n"
val t = Symbol.printTable (!myTable)

val t = (myTable :=  Symbol.remove ((!myTable) , s1 ))
(* val t = (myTable :=  Symbol.remove ((!myTable) , s1 )) *)
val t = print "===========\n"
val t = Symbol.printTable (!myTable)
val t = Symbol.printAllSymbols()
     
type RHS = Atom.atom list
structure RHS_KEY : ORD_KEY = struct
    type ord_key = Atom.atom list;
    fun compare ([] , []) = EQUAL
        | compare ([] , xs) = LESS
        | compare (xs , []) = GREATER
        | compare (x::xs , y::ys) = case Atom.compare (x , y) 
                                 of GREATER => GREATER
                                | LESS => LESS
                                | EQUAL => compare (xs , ys)
end

structure RHSSet = RedBlackSetFn (RHS_KEY)
type Productions = RHSSet.set
type Rules = Productions AtomMap.map
type Grammar    = { symbols : AtomSet.set, tokens : AtomSet.set, rules : Rules }
val symbols = ref AtomSet.empty
val tokens = ref AtomSet.empty


fun addSymbols a = let 
                val sym = Atom.atom a
                in 
                symbols := AtomSet.add (!symbols , sym)
                end

fun printListAtom (x::xs) = (print(Atom.toString x ^ " ") ; printListAtom xs)
    | printListAtom [] = print ("\n")


fun printListListAtom x = map printListAtom x



fun printAtomSet x = let 
                    val listOfSymbols = AtomSet.listItems (x)
                   in
                    printListAtom listOfSymbols
                   end 

fun addTokens a = let 
                val sym = Atom.atom a
                in 
                tokens := AtomSet.add (!tokens , sym)
                end
fun printSymbols () = printAtomSet (!symbols) 
fun printTokens () = printAtomSet (!tokens) 

fun toAtomList [] = []
    | toAtomList (x::xs) = (Atom.atom x :: (toAtomList xs))

fun toAtomListList [] = []
    | toAtomListList (x::xs) = (toAtomList x :: (toAtomListList xs) )


fun toProductions x = RHSSet.fromList (toAtomListList x) 
val rules:Rules ref = ref AtomMap.empty
fun addRule A x = (rules := AtomMap.insert (!rules ,  (Atom.atom A) , toProductions x  )) 


fun printOneProduction (x,y) = ( print( (Atom.toString x) ^ "-> "); printListListAtom( RHSSet.listItems y)) 
fun printRules () = map printOneProduction (AtomMap.listItemsi (!rules)) 
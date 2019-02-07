structure fGrammar = struct
open nGrammar;
val t = print ("This is for first\n")

(* This is used to create the map that will contain the first of all the tokens *)
(* Initially this map is initialised to empty for all the tokens *)
(* The keys are the tokens and the value is atom list *)
type set = AtomSet.set
type atomMap = set AtomMap.map
val firstAllSymbols:atomMap ref = ref AtomMap.empty

(*Initialise the map *)
(* Insert the tokens first *)

(* This one takes one atom element and put it in the map*)
fun putOneToken x = (firstAllSymbols :=  AtomMap.insert ((!firstAllSymbols) , x , AtomSet.fromList ([x]) ))
fun insertTokensFirst x = map putOneToken (AtomSet.listItems x)
val t = insertTokensFirst (!tokens)

(* this take the list from the symbols and put it in the map with empty set*)
fun putOneSymbol x = (firstAllSymbols := AtomMap.insert ((!firstAllSymbols) , x , AtomSet.empty ))
fun insertSymbolsFirst x = map putOneSymbol (AtomSet.listItems x)
val t = insertSymbolsFirst (!symbols)


(* print the first *)
fun printMap s = let 
                    val x = AtomMap.listItemsi s
                    fun f (a , b) = ( printAtom a ; printAtomSet b)
                in
                    (map f x)
                end 

val t = printMap (!firstAllSymbols)

(*This function will take the atom list
Check if the element is nullable ; if yes then return its first and the first of the remainig list 
If the element is not nullable then simply return its nullable and abort the process
*)
fun firstAtomList [] = AtomSet.empty
    | firstAtomList (x::xs) = (if AtomSet.member ( (!nullable) , x) = true then 
                                AtomSet.union ( (AtomMap.lookup ((!firstAllSymbols) , x)) ,(firstAtomList xs) )
                                else          
                                (AtomSet.singleton (x))
                              ) 


(*This function will go through a single production of the form A -> x and return the first
Contains only one iteration *)
(* fun onePassFirst A x =  *)



end
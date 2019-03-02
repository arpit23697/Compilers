structure fGrammar = struct
open nGrammar;
val x = print("=========== This is for first ========== \n")

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
                    fun f (a , b) = ( printAtom a ; print (" -> ") ;printAtomSet b)
                in
                    (map f x)
                end 

(*This function will take the atom list
Check if the element is nullable ; if yes then return its first and the first of the remainig list 
If the element is not nullable then simply return its nullable and abort the process
*)
fun firstAtomList [] = (AtomSet.empty)
    | firstAtomList (x::xs) = (if AtomSet.member ( (!nullable) , x) = true then 
                                ( let 
                                    val t1 = firstAtomList xs
                                    val t2 = AtomMap.lookup ((!firstAllSymbols) , x )
                                  in 
                                    AtomSet.union ( t2 , t1) 
                                  end
                                )
                                else         
                                 AtomMap.lookup ((!firstAllSymbols) , x)
                              ) 


(*This function will go through a single production of the form A -> x and return the first
after only one iteration *)
(* fun onePassFirst A x =  *)
(* Note this function will go through all the production of the symbol A*)
(* So A is an atom and x is a set of atom list  *)

val temp = ref AtomSet.empty;

fun updateTemp x = (temp := AtomSet.union (!temp , firstAtomList x ))

(* Update will be in the reference temp *)
fun firstOneProduction (A:Atom.atom) x = let 
                                val l = (RHSSet.listItems x)
                                val x = (temp := AtomSet.empty);
                            in 
                                map updateTemp l
                            end

(*update the first using the production of only symbol*)
fun updateFirstOneSymbol (A, x) = ( (firstOneProduction A x);  firstAllSymbols := AtomMap.insert ( 
                                                            (!firstAllSymbols) , A ,
                                                            AtomSet.union ( (AtomMap.lookup ( (!firstAllSymbols) , A )) ,
                                                             !temp  )) )

(*Update the first after one iteration over the whole grammar*)
fun oneIterGrammarFirst () = map updateFirstOneSymbol (AtomMap.listItemsi (!rules))

(* finds the first by iterating over the grammar n number of time where n = number of symbols *)
fun findFirst n = if n > 1 then (oneIterGrammarFirst () ; findFirst (n-1) ) else oneIterGrammarFirst () 
val t = findFirst (AtomSet.numItems (!symbols))

(*Print the first*)
val x = printMap (!firstAllSymbols)




end
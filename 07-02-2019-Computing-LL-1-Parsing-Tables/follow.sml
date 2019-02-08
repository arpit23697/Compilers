structure foGrammar = struct 

open fGrammar;
val x = print("=========== This is for Follow ========== \n")

(* Creating the map that is going to contain the follow of each of the symbols *)
type set = AtomSet.set 
type atomMap = set AtomMap.map
val followAllSymbols: atomMap ref = ref AtomMap.empty

(* Inserting the symbols in the followAllSymbols with the empty atom set *)
fun putSymbolFollow x = (followAllSymbols := AtomMap.insert ((!followAllSymbols) , x , AtomSet.empty ))
fun insertSymbolsFollow x = map putSymbolFollow (AtomSet.listItems x)
val t = insertSymbolsFollow (!symbols)

(* This function takes the list of atoms and for all the symbols in the list find its follow
with current info and put it in the map *)
fun followAtomList (A , []) = ()
    | followAtomList (A ,  (x :: xs)) = (
                                        if AtomSet.member ( (!symbols , x) ) = true 
                                        then 
                                            (if checkRuleNullable xs = true
                                            then 
                                                let
                                                val t0 = AtomMap.lookup ( (!followAllSymbols) , x) 
                                                val t1 = firstAtomList xs
                                                val t2 = AtomMap.lookup ( (!followAllSymbols) , A )
                                                val t3 = AtomSet.union (t1 , t2)
                                                in
                                                    (followAllSymbols := AtomMap.insert ( (!followAllSymbols) , x , AtomSet.union (t0 , t3) )   )
                                                end
                                            else
                                                let 
                                                val t0 = AtomMap.lookup ( (!followAllSymbols) , x)
                                                val t1 = firstAtomList xs
                                                in 
                                                    (followAllSymbols := AtomMap.insert ( (!followAllSymbols) , x , AtomSet.union (t0 , t1)  ))
                                                end
                                         ; followAtomList (A , xs) )
                                    else
                                    followAtomList (A , xs)
                                   )


(* This function goes through production of only one symbol and update the follow *)
(* So A is atom and x is set of list of atoms *)
fun followOneProduction (A, x) = let
                                    val t = RHSSet.listItems x
                                    fun f x = followAtomList (A , x)
                              in 
                                    map f t
                              end

(* This function goes through the whole grammar ones *)
fun followOneIter () = map followOneProduction (AtomMap.listItemsi (!rules))

(*Running for n iterations*)
fun findFollow n = if n > 1 then (followOneIter () ; findFollow (n-1) ) else followOneIter()

(*finding the follow*)
val t = findFollow (AtomSet.numItems (!symbols) )
val x = printMap (!followAllSymbols)



end
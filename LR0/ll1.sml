structure ll1 = struct 

open foGrammar;
val x = print("=========== This is for LL1 ========== \n")



fun printAtomS x = (print (Atom.toString x) ; print "")
fun printListAtomProduction x = (map printAtomS x ; print "")
(* This function goes through one of the production of the form A-> x and add it to where it is required*)
(* So here A is the atom and x is the list of atoms *)
(* This one return the set of all the tokens where it is going appear in the ll1 table *)
fun oneProductionList (A, x) = if checkRuleNullable x = true   
                            then    
                                let 
                                    val t1 = firstAtomList x
                                    val t2 = AtomMap.lookup ( (!followAllSymbols ) , A)
                                in
                                    AtomSet.union (t1 , t2)
                                end
                            else
                                 firstAtomList x


fun printProduction (A , x) = let 
                            val t1 = oneProductionList (A , x )
                            val t2 = AtomSet.listItems ((!tokens)) 
                            fun f x2 = if (AtomSet.member ( t1 , x2 )) = true then ( printAtomS A ; print "->" ; printListAtomProduction x ; print " " )
                                                                            else
                                                                                (print "   -   ") 
                             in 
                                map f t2
                             end


(* This function goes through all the productions and give the LL1 table *)
fun allProductionll (A , x) = let 
                            val t = RHSSet.listItems x
                            fun f x = (print "\n" ; printAtom A ; print "   " ;
                              printProduction (A , x) ; print "\n")
                            in 
                                map f t 
                            end 

fun wholeGrammarll () = map allProductionll (AtomMap.listItemsi (!rules))


(* For better printing *)
fun printAtomTab x = print (Atom.toString x ^ "      ")
fun printAtomList x = map printAtomTab x

(* for printing the atom list on the first line *)
val x = print ("\t")
val x = printAtomList (AtomSet.listItems (!tokens) )



val x = wholeGrammarll ()



end

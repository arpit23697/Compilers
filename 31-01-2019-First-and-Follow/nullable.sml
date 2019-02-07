structure nGrammar = struct

open Grammar;
val x = print("=========== This is for nullable ========== \n")
(* nullable is a variabe which is atom set and contains all the elements that are empty *)
val nullable = ref AtomSet.empty

(* Takes list of atoms ; check wether each element is in the list or not ; and take the and of respective 
booleans *)
fun checkRuleNullable [] = true
    | checkRuleNullable (x::xs) = ((AtomSet.member (!nullable , x)) andalso (checkRuleNullable xs))

(*Takes list of list of atoms and return whether there is any list that is nullable*)
fun checkNullable [] = false
    | checkNullable (x::xs) = ( (checkRuleNullable x) orelse (checkNullable xs) )

(* Takes a production of the form A -> x and checks if A is nullable *)
fun passProduction (A , x) = let 
                            val l = RHSSet.listItems x      (* list of list of atom *)
                            in 
                            if (checkNullable l) = true then (nullable := AtomSet.add (!nullable , A)) else () 
                            end
(* Pass through the whole grammar ones and updates the nullable*)
fun passAllRules () = map passProduction (AtomMap.listItemsi (!rules))

val x = passAllRules ()
val x = printAtomSet (!nullable)

fun findNullable () = let
                    val x = (!nullable)
                    val z = passAllRules() 
                     in
                    if (AtomSet.equal (x , (!nullable) ) = false) then (findNullable ()) else ()
                    end

end
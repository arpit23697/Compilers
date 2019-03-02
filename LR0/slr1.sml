structure slr1 = struct 

(* open the follow grammar as it contains all the previous functions for first, follow and nullable*)
open foGrammar;
val x = print("==================================== This is for the slr1 ==============================\n")

(* type for the lr0 item
lhs : this is the left hand side of the grammar 
before : right side of the production before "."
after : right side of the production after "."
*)
type Item = {   lhs : Atom.atom ,             (* the left hand side *)
                before : Atom.atom list,      (* the symbols/tokens before the dot*)
                after : Atom.atom list        (* The symbols/tokens after the dot*)
            }


fun compare_atom_list ([] , []) = EQUAL
        | compare_atom_list ([] , xs) = LESS
        | compare_atom_list (xs , []) = GREATER
        | compare_atom_list (x::xs , y::ys) = case Atom.compare (x , y) 
                                of GREATER => GREATER
                                | LESS => LESS
                                | EQUAL => compare_atom_list (xs , ys)

(* Structure for comparing the lrItems 
This is created since we want to create the set of the lrItems
and atomMap that have the lrItems as the key*)

structure ItemKey : ORD_KEY = struct
    type ord_key = Item

    fun compare ((x, y):(Item * Item)) = let val lhs1 = #lhs x 
                                             val lhs2 = #lhs y 
                                             val before1 = #before x 
                                             val before2 = #before y 
                                             val after1 = #after x 
                                             val after2 = #after y
                                          in
                            
                                            case (Atom.compare (lhs1 , lhs2) , compare_atom_list (before1 , before2) , compare_atom_list(after1 , after2)) 
                                            of (LESS , _ , _) => LESS
                                            | (GREATER , _ ,_ ) => GREATER
                                            | (EQUAL , LESS , _) => LESS
                                            | (EQUAL , GREATER , _) => GREATER
                                            | (EQUAL , EQUAL , LESS ) => LESS
                                            | (EQUAL , EQUAL , GREATER ) => GREATER
                                            | (EQUAL , EQUAL , EQUAL) => EQUAL 
                                           
                                           end 
end


(* Item set that contains the lrItems as the element *)
structure ItemSet = RedBlackSetFn(ItemKey)
type LRItemSet = ItemSet.set

(* This structure defines the ordering over the set of LR items *)
structure ItemSetKey: ORD_KEY = struct
    type ord_key = LRItemSet
    fun compare (x,y) = ItemSet.compare (x,y)
end




(* In this map the keys are atoms and the values are LR Item set *)
type atomToLRItemSet = LRItemSet AtomMap.map

(*in this map the keys are lrItemsSet and the value are atoms
*)
structure ItemSetMap = RedBlackMapFn(ItemSetKey)
type lRItemSettoAtom = Atom.atom ItemSetMap.map

(* Helper function for printing the lr0 items *)
fun printLRItem (x:Item) = let val a = #lhs x 
                               val b = #before x 
                               val c = #after x
                            in
                                ( print "    " ; printAtom a ; 
                                print(" -> ") ;
                                (map printAtom (List.rev b) );
                                print(". ") ;
                                (map printAtom c) ;
                                print "\n")
                             end

(* This function is for printing the lrItem set *)
fun printLRItemSet x = map printLRItem (ItemSet.listItems(x))   

(* function printing ItemSetMap *)
fun printLRItemSettoAtom (x:lRItemSettoAtom) = let 
                                                fun f (key , value) = ( printLRItemSet (key) ; print "State : " ; printAtom value ; print "\n" ) 
                                            in
                                               map f (ItemSetMap.listItemsi x) 
                                            end


fun printAtomToLRItemSet (x:atomToLRItemSet) = let 
                                                fun f (key , value) = (print "State : " ; printAtom key ; print "\n" ; printLRItemSet (value))
                                            in
                                                map f (AtomMap.listItemsi x)
                                            end


(* This function takes one lrItem find its closure and return the set
 Go through each of the items  *)
fun closure_OneItem (x:Item) = let 
                                val lhs1 = #lhs x 
                                val before1 = #before x
                                val after1 = #after x
                                val newSet:LRItemSet ref = ref (ItemSet.singleton x) (*Puts the single element in the set of its closure*)

                                (* the type of right side is atom list *)
                                fun f right_side = if (List.null (after1) = false)
                                                    then 
                                                  let
                                                    val firstElement = List.hd after1
                                                    val aItem = { lhs       = firstElement,
                                                                before = List.map Atom.atom [],
                                                                after = right_side
                                                                }
                                                  in 
                                                    newSet := ItemSet.union( (!newSet) , ItemSet.singleton aItem)
                                                   end
                                                 else
                                                    ()           
                               in 
                               
                                (*if x is a token then no change *)
                                    if (List.null (after1) = false)
                                    then
                                        let 
                                            val firstElement = List.hd after1
                                        in 
                                            if AtomSet.member ( (!tokens , firstElement) ) = true
                                            then
                                            (!newSet)
                                            else
                                            ( map f (RHSSet.listItems((AtomMap.lookup( (!rules) , firstElement)) )) ;
                                            (!newSet) )
                                        end
                                else
                                    (ItemSet.singleton x) 
                               end 

(* This function takes the set of LRItems and then find it's closure for only one iteration *)
(* So this function simply goes through all the items in the set and include it's closure *)
fun fullClosure_oneIter (x:LRItemSet)  = let
                                            val newSet:LRItemSet ref = ref x   (*Start the newSet with the value x*)
                                            fun f oneItem = (newSet := ItemSet.union( (!newSet) , (closure_OneItem oneItem) ))
                                        in
                                            ((map f (ItemSet.listItems x) );
                                            (!newSet))
                                        end


(* This function will take the full closure given the set of lr0 items*)
fun fullClosure (x:LRItemSet) = let 
                                    val newSet:LRItemSet ref = ref x
                                    val oldSet:LRItemSet ref = ref ItemSet.empty             
                                in
                                   while( (ItemSet.equal( (!newSet) , (!oldSet) ) ) = false)
                                                do
                                                ( 
                                                    oldSet := (!newSet);
                                                    newSet := fullClosure_oneIter (!newSet)
                                                );
                                    (!newSet)
                                end 

(* Counter to keep account of total number of states *)
val totolNumberOfStates = ref 0
val StateToAtomMap: lRItemSettoAtom ref = ref ItemSetMap.empty 
val AtomtoStateMap: atomToLRItemSet ref = ref AtomMap.empty 



(* this function takes the LRItemSet , check if it is already a state if not insert it into map *)
fun insertIntoItemMap (x:LRItemSet):Bool.bool = if ItemSetMap.inDomain( (!StateToAtomMap) , x) = false
                                      then
                                        let 
                                            val t1 = totolNumberOfStates := !totolNumberOfStates + 1
                                            val t2 = Atom.atom (Int.toString (!totolNumberOfStates))
                                        in
                                            (
                                             StateToAtomMap := ItemSetMap.insert( (!StateToAtomMap) , x , t2);
                                             AtomtoStateMap := AtomMap.insert ( (!AtomtoStateMap) , t2 , x);
                                             true        
                                            ) 
                                        end
                                     else
                                     (false) 



fun goto ( I:LRItemSet , X:Atom.atom ) = let
                                    val newSet:LRItemSet ref = ref ItemSet.empty
                                    fun f (y:Item) = let 
                                                        
                                                        val lhs1 = #lhs y
                                                        val before1 = #before y
                                                        val after1 = #after y
                                                    in
                                                        if (List.null(after1) = false )
                                                        then
                                                            let
                                                                val firstElement = List.hd after1
                                                            in
                                                                if (Atom.compare(firstElement,X) = EQUAL)
                                                                then
                                                                    let 
                                                                        val aItem = { lhs       = lhs1,
                                                                                    before = firstElement :: before1,
                                                                                    after = List.tl after1
                                                                                    }
                                                                    in
                                                                        (newSet := ItemSet.union( (!newSet) , ItemSet.singleton aItem))
                                                                    end
                                                                else
                                                                    ()
                                                            end 
                                                        else
                                                        () 
                                                        
                                                    end 
                                    in 
                                    (
                                        map f (ItemSet.listItems I);
                                        fullClosure(!newSet)
                                    ) 
                                   end 


(* We need some data structure to store the edges *)
(* For the edges *)
(* Keys are the atoms which correspond to the state number and values are another state and the symbol or the token *)
type gotoEdgesType = RHSSet.set AtomMap.map
val gotoEdges: gotoEdgesType ref = ref AtomMap.empty

(* Info about the states is stored in the map AtomtoStateMap and StatetoAtomMap *)


(* Initialise the AtomtoStateMap  *)
(* An example of the lr0 item  *)
val sProduction = List.hd (RHSSet.listItems (AtomMap.lookup ((!rules) , Atom.atom "S'")))
val initialItem = { lhs       = Atom.atom "S'",
                before = List.map Atom.atom [],
                after  = sProduction
                }
val t = insertIntoItemMap (fullClosure (ItemSet.singleton initialItem))
fun slr_oneIteration () = let 
                        val ans:Bool.bool ref = ref false
                        fun f ((oneState:LRItemSet), stateNo) = let 
                                                        val  t3 = if AtomMap.inDomain( (!gotoEdges) , stateNo ) = false
                                                                then 
                                                                (gotoEdges := AtomMap.insert( (!gotoEdges) , stateNo , RHSSet.empty ) )
                                                                else
                                                                ()
                                                        fun g (oneItem:Item) = let 
                                                                                    val lhs1 = #lhs oneItem
                                                                                    val before1 = #before oneItem
                                                                                    val after1 = #after oneItem
                                                                                in 
                                                                                    if (List.null (after1) = false)
                                                                                    then
                                                                                        if (Atom.compare (List.hd (after1) , Atom.atom "$") = EQUAL)
                                                                                        then
                                                                                            let 
                                                                                            val firstElement = List.hd (after1)
                                                                                            val stateNo1 = ItemSetMap.lookup( (!StateToAtomMap) , oneState)
                                                                                            val t = [(Atom.atom "Accept on ") , firstElement ]
                                                                                            val prevActions = AtomMap.lookup ( (!gotoEdges),  stateNo1)
                                                                                            val newActionComplete = RHSSet.add (prevActions , t)
                                                                                            in
                                                                                                (
                                                                                                    (gotoEdges := AtomMap.insert( (!gotoEdges) , stateNo1 , newActionComplete) )
                                                                                                )
                                                                                            end
                                                                                        else
                                                                                            let 
                                                                                                val firstElement = List.hd (after1)
                                                                                                val nextState = goto (oneState , firstElement)
                                                                                                val temp = insertIntoItemMap (nextState)
                                                                                                val temp2 = (ans := (temp orelse (!ans)) ) 
                                                                                                val stateNo1 = ItemSetMap.lookup( (!StateToAtomMap) , oneState)
                                                                                                val stateNo2 = ItemSetMap.lookup( (!StateToAtomMap) , nextState)
                                                                                                
                                                                                                val action = if AtomSet.member( (!symbols) , firstElement ) = true
                                                                                                            then
                                                                                                                Atom.atom "Goto on"
                                                                                                            else 
                                                                                                                Atom.atom "Shift on"

                                                                                                val t = [stateNo2 , action , firstElement]
                                                                                                val prevActions = AtomMap.lookup ( (!gotoEdges),  stateNo1)
                                                                                                val newActionComplete = RHSSet.add (prevActions , t)
                                                                                            in 
                                                                                                (
                                                                                                    (gotoEdges := AtomMap.insert( (!gotoEdges) , stateNo1 , newActionComplete) )
                                                                                                )
                                                                                            end
                                                                                    else
                                                                                    ()
                                                                                end
                                                    in 
                                                        map g (ItemSet.listItems oneState)
                                                    end
                        in 
                            (
                                map f (ItemSetMap.listItemsi (!StateToAtomMap) );
                                (!ans)
                            ) 
                        end

fun findSLR () = let 
                    val t = slr_oneIteration()
                in
                    if (t = true) then findSLR() else () 
                end

(* Function to find the reduce operations *)
fun reduceOneState  (oneState:LRItemSet , stateNo) = let 
                                                        fun g(oneItem:Item) = let 
                                                                            val lhs1 = #lhs oneItem
                                                                            val before1 = #before oneItem
                                                                            val after1 = #after oneItem
                                                                            val prod = AtomMap.lookup ((!rules) , lhs1)
                                                                            val followSet = AtomMap.lookup ((!followAllSymbols) , lhs1)
                                                                            val followList = AtomSet.listItems (followSet)
                                                                            fun printList (x::xs) = (printAtom x ; print " " ; printList xs)
                                                                                | printList [] = (print "")
                                                                            fun h rhs = if compare_atom_list ( (List.rev before1) , rhs) = EQUAL
                                                                                        then
                                                                                        (print "Reduce on state " ;
                                                                                            printAtom stateNo ;
                                                                                            print "using Production : " ;
                                                                                            printAtom lhs1 ; 
                                                                                            print " -> ";
                                                                                            printList rhs;
                                                                                            print " with lookup symbol - ";
                                                                                            printList followList;
                                                                                            print "\n"
                                                                                        )
                                                                                        else
                                                                                        ()
                                                                            in 
                                                                                map h (RHSSet.listItems prod)
                                                                            end
                                                         in
                                                            map g (ItemSet.listItems oneState)
                                                         end

fun reduceOperations () = map reduceOneState (ItemSetMap.listItemsi (!StateToAtomMap) )
                           


fun nicePrinting () = let  
                        fun f (stateNo , state) = let 
                                                  val operationSet = AtomMap.lookup( (!gotoEdges) , stateNo )
                                                  val operationList = RHSSet.listItems operationSet
                                                  fun g x = ((printAtom stateNo) ; print(" --> ") ; printListAtom x )
                                                in
                                                    (
                                                    print "****************\n";
                                                    print "State : ";
                                                    printAtom stateNo ;
                                                    print "\n" ; 
                                                    printLRItemSet (state); 
                                                    print "\n";
                                                    map g operationList;
                                                    reduceOneState (state , stateNo);
                                                    print "\n***************\n"
                                                    ) 
                                              end
                      in
                        map f (AtomMap.listItemsi (!AtomtoStateMap ) ) 
                    end



val t = findSLR()
fun printgotoAction () = map printOneProduction (AtomMap.listItemsi (!gotoEdges))

val t = nicePrinting ()
val t = "==================================================="
(* val t = printAtomToLRItemSet (!AtomtoStateMap)
val t = print "\n \n \n"

val t = printgotoAction()
val t = print "\n \n \n"

val t= reduceOperations () *)

(* An example of the lr0 item  *)
(* val aItem = { lhs       = Atom.atom "S",
              before = List.map Atom.atom [],
              after  = List.map Atom.atom ["(" , "L" , ")"]
            } *)


(* val temp = ItemSetMap.lookup ( (!StateToAtomMap) , oneIter)  *)
(* val gotoSet = goto (ItemSet.singleton aItem , (Atom.atom "(") ) *)
(* val t = printLRItemSet gotoSet *)

(* val t = print "Done" *)

(* val t = print "hiiifdsajldafi\n" *)
(* val aItemClosure = closure_OneItem aItem *)
(* val t = printLRItemSet aItemClosure *)

(* val t =print "afdfa]\n" *)
(* val oneIter = fullClosure (ItemSet.singleton aItem) *)
(* val t = printLRItemSet oneIter *)

(* val t = insertIntoItemMap (oneIter) *)
(* val t = insertIntoItemMap (ItemSet.singleton aItem) *)
(* val t = insertIntoItemMap (ItemSet.singleton aItem) *)
(* val t = printLRItemSettoAtom (!StateToAtomMap) *)

(* val t = print "\n \n \n" *)
end
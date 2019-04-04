signature GRAPH = 
sig 
    type graph 
    type node 

    val nodeList: unit -> node list 
    val successor : node -> node list 
    val predecesor : node -> node list 
    val adjacent : node -> node list  

    (* val newGraph : graph  *)
    val newNode : node -> unit 

    exception noSuchNode 
    val mk_edge : (node * node  ) -> unit
    val rm_edge : (node * node) -> unit

    val printGraph : unit -> unit list
    val nodeMap : unit -> (node * int) list

end

signature faltu = sig end

(* Structure for the graph *)
functor generateGraph (O : ORD_KEY ):GRAPH= struct

    type node = O.ord_key
    type graph = {succ : int list IntBinaryMap.map ref, 
                pred : int list IntBinaryMap.map ref, 
                nodeList : node list ref,
                total_nodes : int ref}

    (* map : node -> int *)
    structure nodeToIntType = RedBlackMapFn (O)

    type nToInt = int nodeToIntType.map
    type intToN = node IntBinaryMap.map

    val nodeToInt : nToInt ref =ref  nodeToIntType.empty
    val intToNode : intToN ref =ref  IntBinaryMap.empty

    (* map : int -> node *)
    val newGraph : graph  = {
                            succ = ref IntBinaryMap.empty,
                            pred = ref IntBinaryMap.empty ,
                            nodeList = ref [],
                            total_nodes = ref 0
                        }

    val myGraph : graph ref = ref newGraph

    exception noSuchNode 

    fun totalNodes () = let 
                            val g = !myGraph
                        in 
                        !(#total_nodes g) 
                        end
    (* Takes the graph and gives the nodes 
    Note this is not of type of node 
    Return type is of type int 
    
    There will be a separate function to attach the labels to the node*)
    fun newNode_ () =   let 
                                    val g = !(myGraph)
                                    val t = !(#total_nodes g) + 1
                                    val old_map = !(#pred g)
                                    val temp = ( (#pred g) := IntBinaryMap.insert( old_map, t , [] )  )
                                    val old_map = !(#succ g)
                                    val temp = ((#succ g) := IntBinaryMap.insert (old_map , t , []))
                                    val temp = ( (#total_nodes g) := (!(#total_nodes g)) + 1)
                                in 
                                ( (myGraph := g) ;
                                (!(#total_nodes g)))
                                end
    
    fun successor_ (n : int) = let 
                                            val g = !(myGraph)
                                            val succ_map = !(#succ g)
                                          in 
                                            if (IntBinaryMap.inDomain (succ_map  , n) = true)
                                            then 
                                            IntBinaryMap.lookup (succ_map , n)
                                            else 
                                            (print "Node not found"; raise noSuchNode)
                                          end   

    fun predecesor_ ( n : int) = let 
                                            val g = !(myGraph)
                                            val pred_map = !(#pred g)
                                          in 
                                            if (IntBinaryMap.inDomain (pred_map  , n) = true)
                                            then 
                                            IntBinaryMap.lookup (pred_map , n)
                                            else 
                                            (print "Node not found"; raise noSuchNode)
                                          end

    fun adjacent_ (n : int ) = let
                                    val g = !(myGraph) 
                                    val succ_map = !(#succ g)
                                    val pred_map = !(#pred g)
                                  in 
                                    if (IntBinaryMap.inDomain (succ_map  , n) = true)
                                    then 
                                        let  
                                            val succ_list = IntBinaryMap.lookup (succ_map , n)
                                            val pred_list = IntBinaryMap.lookup (pred_map , n)
                                            val succ_set = IntBinarySet.fromList (succ_list)
                                            val pred_set = IntBinarySet.fromList (pred_list)
                                            val adjacent_set = IntBinarySet.union (succ_set , pred_set)
                                        in 
                                            (IntBinarySet.listItems(adjacent_set))
                                        end
                                    else 
                                    (print "Node not found"; raise noSuchNode)
                                  end

        (* Takes the element and remove it from the list *)
    fun remove_element_from_list (x::xs , y) = if (x = y) then 
                                                remove_element_from_list (xs,y)
                                                else 
                                                (x :: remove_element_from_list (xs , y) )
        | remove_element_from_list ([] , y) = []
    (* Takes the graph and just make the necessary edges *)
    fun mk_edge_ (x:int, y:int) = let
                                            val g = !(myGraph) 
                                            val pred_map = !(#pred g) 
                                            val succ_map = !(#succ g)
                                            in 
                                            if ( IntBinaryMap.inDomain(pred_map , x) andalso IntBinaryMap.inDomain(pred_map , y)) = true 
                                            then 
                                                let 
                                                    val succ_list = IntBinaryMap.lookup (succ_map , x)
                                                    val pred_list = IntBinaryMap.lookup (pred_map , y)
                                                    val succ_list_new = y :: succ_list
                                                    val pred_list_new = x :: pred_list 
                                                    val succ_map_new = IntBinaryMap.insert(succ_map , x , succ_list_new)
                                                    val pred_map_new = IntBinaryMap.insert(pred_map , y , pred_list_new)
                                                    val temp = ((#succ g) := succ_map_new)
                                                    val temp = ((#pred g) := pred_map_new) 
                                                in 
                                                    (myGraph := g)
                                                end 
                                            else 
                                            (print "Node not found"; raise noSuchNode)
                                            end 

    fun rm_edge_ (x:int , y:int) = let 
                                            val g = !myGraph
                                            val pred_map = !(#pred g) 
                                            val succ_map = !(#succ g)
                                            in 
                                            if ( IntBinaryMap.inDomain(pred_map , x) andalso IntBinaryMap.inDomain(pred_map , y)) = true 
                                            then 
                                                let 
                                                    val succ_list = IntBinaryMap.lookup (succ_map , x)
                                                    val pred_list = IntBinaryMap.lookup (pred_map , y)
                                                    val succ_list_new = remove_element_from_list (succ_list , y)
                                                    val pred_list_new = remove_element_from_list (pred_list , x)
                                                    val succ_map_new = IntBinaryMap.insert(succ_map , x , succ_list_new)
                                                    val pred_map_new = IntBinaryMap.insert(pred_map , y , pred_list_new)
                                                    val temp = ((#succ g) := succ_map_new)
                                                    val temp = ((#pred g) := pred_map_new) 
                                                in 
                                                    (myGraph := g)
                                                end 
                                            else 
                                            (print "Node not found"; raise noSuchNode)
                                            end 


    fun newNode (x:node) = let 
                            val g = !(myGraph)
                            val n = newNode_()
                            val temp = (nodeToInt := nodeToIntType.insert( (!nodeToInt) , x , n))
                            val temp = (intToNode := IntBinaryMap.insert( (!intToNode) , n , x ))
                            val node_list = !(#nodeList g)
                            val new_node_list = x::node_list
                            (* val temp = print (Int.toString n) *)
                            in 
                                ( (#nodeList g) := new_node_list )
                            end
    (* takes the node and returns all the successor nodes *)
    fun successor (x:node ) = let 
                            val g = !(myGraph)
                            in  
                                if ( nodeToIntType.inDomain( (!nodeToInt) , x ) = true )
                                then 
                                    let
                                        val n = nodeToIntType.lookup((!nodeToInt) , x) 
                                        val succList = successor_( n )
                                        fun f x = IntBinaryMap.lookup( (!intToNode) , x ) 
                                    in 
                                        map f succList
                                    end
                                else
                                    (print ("Error not found") ; raise noSuchNode )
                            end

    fun predecesor (x:node) = if ( nodeToIntType.inDomain( (!nodeToInt) , x ) = true )
                                then 
                                    let
                                        val n = nodeToIntType.lookup((!nodeToInt) , x) 
                                        val predList = predecesor_( n )
                                        fun f x = IntBinaryMap.lookup( (!intToNode) , x ) 
                                    in 
                                        map f predList
                                    end
                                else
                                    (print ("Error not found") ; raise noSuchNode )
                            

    fun adjacent (x:node) = let 
                            val g = !(myGraph)
                            in  
                                if ( nodeToIntType.inDomain( (!nodeToInt) , x ) = true )
                                then 
                                    let
                                        val n = nodeToIntType.lookup((!nodeToInt) , x) 
                                        val adjList = adjacent_( n )
                                        fun f x = IntBinaryMap.lookup( (!intToNode) , x ) 
                                    in 
                                        map f adjList
                                    end
                                else
                                    (print ("Error not found") ; raise noSuchNode )
                            end
    (* Takes two nodes and updates the graph *)
    fun mk_edge ( (from , to) : (node * node ) ) = 
                                if ( nodeToIntType.inDomain( (!nodeToInt) , from  ) andalso 
                                    nodeToIntType.inDomain((!nodeToInt) , to )  = true )
                                then 
                                    let
                                        val x = nodeToIntType.lookup((!nodeToInt) , from )
                                        val y =  nodeToIntType.lookup((!nodeToInt) , to )
                                        (* val temp = (print (Int.toString x); print " dadaf " ; print (Int.toString y)) *)
                                    in 
                                        mk_edge_( x,y )
                                    end
                                else
                                    (print ("Error not found") ; raise noSuchNode )
                            
    fun rm_edge ((from , to) : (node * node)) = if ( nodeToIntType.inDomain( (!nodeToInt) , from  ) andalso 
                                    nodeToIntType.inDomain((!nodeToInt) , to )  = true )
                                then 
                                    let
                                        val x = nodeToIntType.lookup((!nodeToInt) , from )
                                        val y =  nodeToIntType.lookup((!nodeToInt) , to )
                                    in 
                                        rm_edge_( x,y )
                                    end
                                else
                                    (print ("Error not found") ; raise noSuchNode )

    fun nodeList () = let 
                        val g = (!myGraph)
                        in 
                        (!(#nodeList g))
                        end 

    fun nodeMap () = nodeToIntType.listItemsi((!nodeToInt))


    fun printInt x = (print (Int.toString (x)) ; print " ")
    fun printIntList x = (map printInt x ; print "\n") 
    fun printGraph() = let
                                val g = !(myGraph)
                                val succ_map = !(#succ g)
                                fun f (x,y) = (printInt x ; print "-->" ; printIntList y)   
                              in 
                                map f (IntBinaryMap.listItemsi(succ_map))
                              end 


end

(* Testing bench *)
(*  =========================== Create a graph on the strings and print it =================== *)


structure STRING_KEY : ORD_KEY = struct
        type ord_key = string;
        fun compare (x,y) = String.compare(x,y)        
end

structure stringGraph = generateGraph(STRING_KEY)


(* For printing of string *)
fun printString x = (print x ; print " ")
fun printStringList x = (map printString x ; print "\n")

fun printNodeMap l = let 
                    fun f (x,y) = (print x ; print " -> " ; print (Int.toString y) ; print "\n")
                    in 
                    ( map f l)
                    end 

fun printStringGraph ()= let 
                            fun f x = let 
                                        
                                        val sList = stringGraph.successor(x)
                                      in 
                                        ( printString x ; print "-> " ; printStringList sList)
                                      end 
                        in 
                            map f (stringGraph.nodeList())

                        end 

fun printStringGraphAdjacent ()= let 
                            fun f x = let 
                                        
                                        val sList = stringGraph.adjacent(x)
                                      in 
                                        ( printString x ; print "-> " ; printStringList sList)
                                      end 
                        in 
                            map f (stringGraph.nodeList())

                        end 

fun printStringGraphOpposite ()= let 
                            fun f x = let 
                                        
                                        val sList = stringGraph.predecesor(x)
                                      in 
                                        ( printString x ; print "-> " ; printStringList sList)
                                      end 
                        in 
                            map f (stringGraph.nodeList())

                        end 
(* Inserting the node *)
val temp = stringGraph.newNode("arpit")
val temp = stringGraph.newNode("ipsita")
val temp = stringGraph.newNode("srishti")
val temp = stringGraph.newNode("akanksha")
val temp = stringGraph.newNode ("anshi")
(* Printing the nodes *)
val x = stringGraph.nodeList ()
val temp = printStringList x
val temp = printNodeMap (stringGraph.nodeMap())


(* Make the edges *)
val temp = stringGraph.mk_edge("arpit" , "ipsita")
val temp = stringGraph.mk_edge("ipsita" , "arpit")
val temp = stringGraph.mk_edge("arpit" , "srishti")
val temp = stringGraph.mk_edge ("srishti" , "ipsita")
val temp = stringGraph.mk_edge ("srishti" , "anshi")

(* ================= Printing the graph ================== *)
val temp = print "================= Printing graph =================\n"
val temp = printStringGraph()

val temp = print " =================== printing the adjacent =============\n"
val temp = printStringGraphAdjacent()

val temp = print " ======================== print the graph opposite ============= \n"
val temp = printStringGraphOpposite()

val temp = stringGraph.rm_edge ("srishti" , "arpit")
val temp = print "================= Printing graph =================\n"
val temp = printStringGraph()

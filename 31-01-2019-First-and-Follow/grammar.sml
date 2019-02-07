structure Grammar = struct
    type RHS = Atom.atom list

    (*The RHS_Key is used to compare to Atom list*)
    (*Given two list of Atoms this will give the order in the atom list*)
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

    (*RHSSet will define the set whose elements are atom list*)
    structure RHSSet = RedBlackSetFn (RHS_KEY)

    (* Production is the set whose elements are atom list *)
    type Productions = RHSSet.set

    (* AtomMap where Key is the atom and the variable it is pointing is the set of atom list *)
    type Rules = Productions AtomMap.map

    (* Symbols which are set of atoms *)
    (* tokens which are set of atoms *)
    (* rules ; which is atom map whose key is atoms and the value it is pointing to is set of atom list *)
    type Grammar    = { symbols : AtomSet.set, tokens : AtomSet.set, rules : Rules }

    (* symbols and tokens are reference to atom set *)
    val symbols = ref AtomSet.empty
    val tokens = ref AtomSet.empty

    (* This function takes the string and add it to symbols which is an AtomSet *)
    fun addSymbols a = let 
                    val sym = Atom.atom a
                    in 
                    symbols := AtomSet.add (!symbols , sym)
                    end

    (* Print the atom that is given *)
    fun printAtom x = print(Atom.toString x ^ " ")

    (* Takes the list of atom and print it  *)
    fun printListAtom x = (map printAtom x ; print("\n"))


    (* Take the list of list of atoms and print it *)
    fun printListListAtom x = map printListAtom x


    (* Takes the set of atoms and print it 
    First convert it into list of atoms and then print it
    *)
    fun printAtomSet x = let 
                        val listOfSymbols = AtomSet.listItems (x)
                    in
                        printListAtom listOfSymbols
                    end 

    (* Takes the string ; convert it into atom and then add it to tokens which are atom set *)
    fun addTokens a = let 
                    val sym = Atom.atom a
                    in 
                    tokens := AtomSet.add (!tokens , sym)
                    end

    (* For printing the symbols and the tokens *)
    fun printSymbols () = printAtomSet (!symbols) 
    fun printTokens () = printAtomSet (!tokens) 

    (* Takes the list of string and convert it into list of atoms *)
    fun toAtomList x = map Atom.atom x
    (* Takes the list of list of string and convert it into list of list of atom *)
    fun toAtomListList x = map toAtomList x


    (* Take the list of list of string ; convert it into list of list of atom ; convert it into set *)
    fun toProductions x = RHSSet.fromList (toAtomListList x) 

    (* rules a reference that is of type Rules *)
    (* Rules is a atomMap where key is atom and variable it is pointing to is set of atom list *)
    val rules:Rules ref = ref AtomMap.empty

    (* Takes a string A which is symbol in our production
    x list of list of string such that A->x is a production for each element
    Add that production to the rules *)
    fun addRule A x = (rules := AtomMap.insert (!rules ,  (Atom.atom A) , toProductions x  )) 

    (* Takes one production and print it *)
    fun printOneProduction (A,x) = let 
                                val l = RHSSet.listItems x          (*list of atom list*)
                                fun f x = (printAtom A ; print(" --> ") ; printListAtom x)
                                in 
                                map f l 
                                end

    (* takes all the rules and print it  *)
    fun printRules () = map printOneProduction (AtomMap.listItemsi (!rules)) 
end
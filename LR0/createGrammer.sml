(* val x = Grammar.addSymbols "S";
val x = Grammar.addSymbols "E";
val x = Grammar.addSymbols "E'";
val x = Grammar.addSymbols "T";
val x = Grammar.addSymbols "T'";
val x = Grammar.addTokens "+";
val x = Grammar.addTokens "*";
val x = Grammar.addTokens "N";
val x = Grammar.addTokens "$";
val x = Grammar.addRule "S" [["E", "$"]];
val x = Grammar.addRule "E" [["T", "E'"]];
val x = Grammar.addRule "E'" [["+" , "T", "E'"] , []];
val x = Grammar.addRule "T" [["N", "T'"]];
val x = Grammar.addRule "T'" [["*", "N" , "T'"] , []];
val x = Grammar.printRules()    *)

 (*
val x = Grammar.addSymbols "S";
val x = Grammar.addSymbols "A";
val x = Grammar.addSymbols "B";
val x = Grammar.addSymbols "D";
val x = Grammar.addTokens "a";
val x = Grammar.addTokens "b";
val x = Grammar.addRule "S" [["D", "B"]];
val x = Grammar.addRule "A" [["a", "A"] , []];
val x = Grammar.addRule "B" [["b", "B"] , []];
val x = Grammar.addRule "D" [["A", "B"]];
val x = Grammar.printRules() *)
(* 
val x = Grammar.addSymbols "A";
val x = Grammar.addSymbols "B";
val x = Grammar.addSymbols "C";
val x = Grammar.addSymbols "D";
val x = Grammar.addTokens "a";
val x = Grammar.addRule "A" [["B"]];
val x = Grammar.addRule "B" [["C"]];
val x = Grammar.addRule "C" [["D"]];
val x = Grammar.addRule "D" [["a"]];
val x = Grammar.printRules()   *)
(* val x = Grammar.addSymbols "S'";
val x = Grammar.addSymbols "S";
val x = Grammar.addSymbols "L";
val x = Grammar.addTokens "$";
val x = Grammar.addTokens "(";
val x = Grammar.addTokens ")";
val x = Grammar.addTokens "x";
val x = Grammar.addTokens ",";
val x = Grammar.addRule "S'" [["S" , "$"]];
val x = Grammar.addRule "S" [["(" , "L" , ")"] , ["x"]];
val x = Grammar.addRule "L" [["S"] , ["L" , "," , "S"]];
val x = Grammar.printRules()  *)
(* val x = Grammar.addSymbols "S'";
val x = Grammar.addSymbols "E";
val x = Grammar.addSymbols "T";
val x = Grammar.addTokens "$";
val x = Grammar.addTokens "+";
val x = Grammar.addTokens "x";
val x = Grammar.addRule "S'" [["E" , "$"]];
val x = Grammar.addRule "E" [["T" , "+" , "E"] , ["T"]];
val x = Grammar.addRule "T" [["x"]];
val x = Grammar.printRules()  *)
 (* val x = Grammar.addSymbols "S'";
val x = Grammar.addSymbols "S";
val x = Grammar.addSymbols "E";
val x = Grammar.addSymbols "V";
val x = Grammar.addTokens "$";
val x = Grammar.addTokens "=";
val x = Grammar.addTokens "x";
val x = Grammar.addTokens "*";
val x = Grammar.addRule "S'" [["S" , "$"]];
val x = Grammar.addRule "S" [["V" , "=" , "E"] , ["E"]];
val x = Grammar.addRule "E" [["V"]];
val x = Grammar.addRule "V" [["*" , "E"] , ["x"]];
val x = Grammar.printRules() *)

val x = Grammar.addSymbols "S'";
val x = Grammar.addSymbols "S";
val x = Grammar.addSymbols "B";

val x = Grammar.addTokens "c";
val x = Grammar.addTokens "$";

val x = Grammar.addRule "S'" [["S" , "$"]];
val x = Grammar.addRule "S" [["B"] ];
val x = Grammar.addRule "B" [["c"]];
(* val x = Grammar.addRule "V" [["*" , "E"] , ["x"]]; *)
val x = Grammar.printRules()
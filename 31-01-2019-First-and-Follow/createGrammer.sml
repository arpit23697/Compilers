val t1 = addSymbols "a";
val t1 = addSymbols "b";
val t1 = addTokens "A";
val t1 = addTokens "B";
val t1 = addTokens "S";

val t1 = printSymbols ();
val t1 = printTokens ();

val t1 = addRule "S" [["a" , "B"], ["a" , "a"]]
val t1 = addRule "B" [["b"]]

val t1 = printRules ();
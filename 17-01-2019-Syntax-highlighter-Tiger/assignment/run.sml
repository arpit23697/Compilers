val fileN = Option.valOf (TextIO.inputLine TextIO.stdIn)
val fileName = String.substring(fileN, 0, size fileN - 1)
 
(* Parse.parse "tiger.tig"
Parse.parse "tiger2.tig" *)
val myOut = Parse.parse fileName
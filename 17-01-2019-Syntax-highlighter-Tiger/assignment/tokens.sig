signature Tiger_TOKENS =
sig
type position  = int * int 
type token = string
val ARRAY:  position -> token
val IF: position -> token
val THEN : position  -> token
val EOF : position  -> token

end
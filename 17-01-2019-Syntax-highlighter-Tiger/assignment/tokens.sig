signature Tiger_TOKENS =
sig
type position  = int * int 
type token = string
val ARRAY:  position * position -> token
val IF: position * position -> token
val THEN : position * position -> token
val EOF : position * position -> token

end
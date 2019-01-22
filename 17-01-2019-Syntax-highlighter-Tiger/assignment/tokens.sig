signature Tiger_TOKENS =
sig
type position  = int * int 
type token = string * string
val ARRAY:  position -> string -> token
val IF: position -> string -> token
val THEN : position -> string -> token
val EOF : position -> string -> token

end
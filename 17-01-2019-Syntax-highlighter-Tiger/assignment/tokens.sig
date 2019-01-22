signature Tiger_TOKENS =
sig
type position  = int * int 
type token = string * string
val KEYWORDS : position -> string -> token
val EOF : position -> string -> token
val WHITESPACE : position -> string -> token
val ILLEGAL : position -> string -> token
val NEWLINE : position -> string -> token
val SYMBOLS : position -> string -> token
val STRING : position -> string -> token
val COMMENT : position -> string -> token
val IDENTIFIER : position -> string -> token
val NUMERIC : position -> string -> token

end
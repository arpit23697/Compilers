signature Tiger_TOKENS =
sig
type ('a,'b) token
type svalue
val c:  'a * 'a -> (svalue,'a) token
val iff:  'a * 'a -> (svalue,'a) token
val FALSE:  'a * 'a -> (svalue,'a) token
val TRUE:  'a * 'a -> (svalue,'a) token
val CHARCONST: (string) *  'a * 'a -> (svalue,'a) token
val NUMCONST: (string) *  'a * 'a -> (svalue,'a) token
val DOT:  'a * 'a -> (svalue,'a) token
val STAR:  'a * 'a -> (svalue,'a) token
val DASH:  'a * 'a -> (svalue,'a) token
val QUES:  'a * 'a -> (svalue,'a) token
val MOD:  'a * 'a -> (svalue,'a) token
val DIV:  'a * 'a -> (svalue,'a) token
val MULT:  'a * 'a -> (svalue,'a) token
val MINUS:  'a * 'a -> (svalue,'a) token
val PLUS:  'a * 'a -> (svalue,'a) token
val NOTEQUAL:  'a * 'a -> (svalue,'a) token
val EQUALEQUAL:  'a * 'a -> (svalue,'a) token
val GREATEREQUAL:  'a * 'a -> (svalue,'a) token
val GREATER:  'a * 'a -> (svalue,'a) token
val LESS:  'a * 'a -> (svalue,'a) token
val LESSEQUAL:  'a * 'a -> (svalue,'a) token
val NOT:  'a * 'a -> (svalue,'a) token
val AND:  'a * 'a -> (svalue,'a) token
val OR:  'a * 'a -> (svalue,'a) token
val DEC:  'a * 'a -> (svalue,'a) token
val INC:  'a * 'a -> (svalue,'a) token
val DIVEQUAL:  'a * 'a -> (svalue,'a) token
val MULTEQUAL:  'a * 'a -> (svalue,'a) token
val MINUSEQUAL:  'a * 'a -> (svalue,'a) token
val PLUSEQUAL:  'a * 'a -> (svalue,'a) token
val EQUAL:  'a * 'a -> (svalue,'a) token
val CONTINUE:  'a * 'a -> (svalue,'a) token
val BREAK:  'a * 'a -> (svalue,'a) token
val RETURN:  'a * 'a -> (svalue,'a) token
val FOR:  'a * 'a -> (svalue,'a) token
val WHILE:  'a * 'a -> (svalue,'a) token
val ELSE:  'a * 'a -> (svalue,'a) token
val IF:  'a * 'a -> (svalue,'a) token
val VOID:  'a * 'a -> (svalue,'a) token
val CHAR:  'a * 'a -> (svalue,'a) token
val BOOL:  'a * 'a -> (svalue,'a) token
val INT:  'a * 'a -> (svalue,'a) token
val RPARA:  'a * 'a -> (svalue,'a) token
val LPARA:  'a * 'a -> (svalue,'a) token
val STATIC:  'a * 'a -> (svalue,'a) token
val RIGHTBRACKET:  'a * 'a -> (svalue,'a) token
val LEFTBRACKET:  'a * 'a -> (svalue,'a) token
val COLON:  'a * 'a -> (svalue,'a) token
val SEMICOLON:  'a * 'a -> (svalue,'a) token
val COMMA:  'a * 'a -> (svalue,'a) token
val RIGHTBRACE:  'a * 'a -> (svalue,'a) token
val LEFTBRACE:  'a * 'a -> (svalue,'a) token
val ID: (string) *  'a * 'a -> (svalue,'a) token
val EOF:  'a * 'a -> (svalue,'a) token
val RECORD:  'a * 'a -> (svalue,'a) token
end
signature Tiger_LRVALS=
sig
structure Tokens : Tiger_TOKENS
structure ParserData:PARSER_DATA
sharing type ParserData.Token.token = Tokens.token
sharing type ParserData.svalue = Tokens.svalue
end


type pos = int
val current_pos = ref 0;
val pos_last_line = ref 1;
type lexresult = Tokens.token
val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos
fun err(p1,p2) = ErrorMsg.error p1

fun eof() = let val pos = hd(!linePos) in Tokens.EOF(pos,!lineNum) ""  end


%% 
ws = [\ \t];
keywords="array" | "if" | "then" | "else" | "while" | "for" | "to" | "do" | "let" | "in" | "end" | "of" | "break" | "nil" | "function" | "var" | "type" | "import" | "primitive" ;



%%
\n	=> (lineNum := !lineNum+1; linePos := yypos :: !linePos; pos_last_line := yypos ;Tokens.NEWLINE (!current_pos , !lineNum) yytext);
{keywords} => (current_pos := yypos - !pos_last_line ; Tokens.KEYWORDS (!current_pos , !lineNum) yytext );
{ws}+   => (current_pos := yypos - !pos_last_line ; Tokens.WHITESPACE (!current_pos , !lineNum) yytext );
.       => (current_pos := yypos - !pos_last_line ; Tokens.ILLEGAL (!current_pos , !lineNum) yytext);


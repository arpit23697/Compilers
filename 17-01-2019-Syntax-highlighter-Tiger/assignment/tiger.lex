
type pos = int
val current_pos = ref 0;
val pos_last_line = ref 1;
type lexresult = Tokens.token
val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos
fun err(p1,p2) = ErrorMsg.error p1

fun eof() = let val pos = hd(!linePos) in Tokens.EOF(pos,!lineNum)  end


%% 
%%
\n	=> (lineNum := !lineNum+1; linePos := yypos :: !linePos; pos_last_line := yypos ; continue());
ARRAY	=> ( current_pos := yypos - !pos_last_line  ;Tokens.ARRAY (!current_pos , !lineNum) );
IF	=> (current_pos := yypos - !pos_last_line ; Tokens.IF (!current_pos , !lineNum));
THEN  	=> (current_pos := yypos - !pos_last_line ; Tokens.THEN (!current_pos , !lineNum) );
.       => (current_pos := yypos - !pos_last_line ; ErrorMsg.error yypos ("illegal character " ^ yytext); continue());
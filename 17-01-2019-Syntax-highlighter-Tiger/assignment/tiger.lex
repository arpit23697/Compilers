
type pos = int
type lexresult = Tokens.token

val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos
fun err(p1,p2) = ErrorMsg.error p1

fun eof() = let val pos = hd(!linePos) in Tokens.EOF((pos,pos) , (pos , pos) ) end


%% 
%%
\n	=> (lineNum := !lineNum+1; linePos := yypos :: !linePos; continue());
ARRAY	=> (Tokens.ARRAY ((yypos , yypos) , (yypos , yypos + 5)));
IF	=> (Tokens.IF ((yypos , yypos) , (yypos , yypos + 2)));
THEN  	=> (Tokens.THEN ((yypos , yypos) , (yypos , yypos + 4)));
.       => (ErrorMsg.error yypos ("illegal character " ^ yytext); continue());
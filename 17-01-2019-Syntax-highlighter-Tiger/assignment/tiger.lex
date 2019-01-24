
type pos = int
val current_pos = ref 0
val pos_last_line = ref 1
type lexresult = Tokens.token
val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos
fun err(p1,p2) = ErrorMsg.error p1
val comment_num = ref 0

fun eof() = let val pos = hd(!linePos) in Tokens.EOF(pos,!lineNum) ""  end

fun update_current yypos = (current_pos := yypos - !pos_last_line)



%% 
ws = [\ \t];
newline = "\n" | "\r" | "\n\r" | "\r\n";
keywords="array" | "if" | "then" | "else" | "while" | "for" | "to" | "do" | "let" | "in" | "end" | "of" | "break" | "nil" | "function" | "var" | "type" | "import" | "primitive" | "class" | "extend" | "method" | "new";
symbols = ","| ":"| ";"| "("| ")"| "["| "]"| "{"| "}"| "."| "+"| "-"| "*"| "/" | "=" | "<>" | "<" | "<=" | ">" | ">=" | "&"| ":=" | "|" ;
d=[0-9]+;

escapes = [abfnrtv] | "num" | "xnum" | "\\" | "\"" | "character";
startComment = "*/";
endComment = "/*";
commentSymbols = "*/" | "/*";


%s COMMENT;

%%
<INITIAL>{newline}                               => (lineNum := !lineNum+1; linePos := yypos :: !linePos; pos_last_line := yypos ;Tokens.NEWLINE (!current_pos , !lineNum) yytext);
<INITIAL>"/*"                                    => (update_current yypos ;YYBEGIN COMMENT ; comment_num := !comment_num + 1 ; Tokens.COMMENT (!current_pos , !lineNum) yytext);
<COMMENT>"/*"                                    => (update_current yypos ;comment_num := !comment_num + 1 ; Tokens.COMMENT (!current_pos , !lineNum) yytext);
<COMMENT>"*/"                                    => (update_current yypos ;comment_num := !comment_num - 1 ; if (!comment_num > 0) then Tokens.COMMENT (!current_pos , !lineNum) yytext else (YYBEGIN INITIAL ; Tokens.COMMENT (!current_pos , !lineNum) yytext)  );
<COMMENT>{newline}                               => (lineNum := !lineNum+1; linePos := yypos :: !linePos; pos_last_line := yypos ;Tokens.COMMENT (!current_pos , !lineNum) yytext );
<COMMENT>.                                       => (update_current yypos ; Tokens.COMMENT (!current_pos , !lineNum) yytext);
<INITIAL>"\""(\\{escapes} | [^\\"])*"\""         => (update_current yypos ; Tokens.STRING (!current_pos , !lineNum) yytext );
<INITIAL>[-+]?{d}([.]{d})?([eE][-+]?{d})?        => (update_current yypos ; Tokens.NUMERIC (!current_pos , !lineNum) yytext );
<INITIAL>{keywords}                              => (update_current yypos ; Tokens.KEYWORDS (!current_pos , !lineNum) yytext );
<INITIAL>{ws}+                                   => (update_current yypos ; Tokens.WHITESPACE (!current_pos , !lineNum) yytext );
<INITIAL>{symbols}                               => (update_current yypos ; Tokens.SYMBOLS (!current_pos , !lineNum) yytext );
<INITIAL>[a-zA-Z_][a-zA-Z0-9_]*                  => (update_current yypos ; Tokens.IDENTIFIER (!current_pos , !lineNum) yytext );
<INITIAL>.                                       => (update_current yypos ; Tokens.ILLEGAL (!current_pos , !lineNum) yytext );


val  lineRef = ref 0 
fun updateLine n      = lineRef := !(lineRef) + n

(* Stuff done to make use of the Tokens module generated by expr.grm *)

type pos = int
type svalue        = Tokens.svalue
type ('a,'b) token = ('a,'b) Tokens.token
type lexresult     = (svalue,pos) token


fun lineRange l r = "line " ^ l
fun error (e,l,r) = TextIO.output(TextIO.stdErr, lineRange l r ^ ":" ^ e ^ "\n")

fun eof   ()      = Tokens.EOF (!lineRef,!lineRef)

%%
%header (functor TigerLexFun(structure Tokens : Tiger_TOKENS));


ws    = [\ \t];
digit = [0-9]+;

%%
\n       => ( updateLine 1; lex() );
{ws}+         => ( lex() );
"if"            => (Tokens.IF (!lineRef , !lineRef));
"then"          => (Tokens.THEN (!lineRef , !lineRef));
{digit}+      => ( Tokens.CONST (  yytext, !lineRef, !lineRef) );
"+"           => ( Tokens.PLUS  (!lineRef,!lineRef) );
"-"           => ( Tokens.MINUS  (!lineRef,!lineRef) );
"*"           => ( Tokens.MUL (!lineRef,!lineRef) );
">"           => (Tokens.GT (!lineRef , !lineRef));
"<"           => (Tokens.LT (!lineRef , !lineRef));
"="           => (Tokens.EQ (!lineRef , !lineRef));
"<="          => (Tokens.EQ_LT (!lineRef , !lineRef));
">="          => (Tokens.EQ_GT (!lineRef , !lineRef));
"true"        => (Tokens.TRUE (!lineRef , !lineRef));
"false"       => (Tokens.FALSE (!lineRef , !lineRef));
";"           => (Tokens.SEMICOLON (!lineRef , !lineRef));
"("           => (Tokens.LPARA (!lineRef , !lineRef));
")"           => (Tokens.RPARA (!lineRef , !lineRef));
[a-zA-Z_][a-zA-Z0-9_]*  => (Tokens.ID (yytext , !lineRef , !lineRef));
":="                    => (Tokens.ASSIGN (!lineRef , !lineRef));
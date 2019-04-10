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

escapes = [abfnrtv] | "num" | "xnum" | "\\" | "\"" | "character";
newline = "\\n" | "\\r" | "\\n\\r" | "\\r\\n";
ws    = [\ \t];


%%
<INITIAL>\n                                  => ( updateLine 1; lex() );
<INITIAL>"#include"{ws}*"<bits/stdc++.h>"       =>  (Tokens.HEADER(yytext , !lineRef , !lineRef) );
<INITIAL>"using"{ws}*"namespace"{ws}*"std"{ws}*";"          => (Tokens.HEADERn(yytext , !lineRef , !lineRef) );
<INITIAL>"="                                 => (Tokens.EQUAL (!lineRef , !lineRef));
<INITIAL>{ws}+                               => ( lex() );
<INITIAL>"{"                                 => (Tokens.LEFTBRACE (!lineRef , !lineRef));
<INITIAL>"}"                                 => (Tokens.RIGHTBRACE (!lineRef , !lineRef));
<INITIAL>","                                 => (Tokens.COMMA (!lineRef , !lineRef));
<INITIAL>";"                                 => (Tokens.SEMICOLON (!lineRef , !lineRef));
<INITIAL>":="                                 => (Tokens.COLONEQUAL (!lineRef , !lineRef));
<INITIAL>":"                                 => (Tokens.COLON (!lineRef , !lineRef));
<INITIAL>"["                                 => (Tokens.LEFTBRACKET (!lineRef , !lineRef));
<INITIAL>"]"                                 => (Tokens.RIGHTBRACKET (!lineRef , !lineRef));
<INITIAL>"("                                 => (Tokens.LPARA (!lineRef , !lineRef));
<INITIAL>")"                                 => (Tokens.RPARA (!lineRef , !lineRef));
<INITIAL>"record"                            =>  (Tokens.RECORD (!lineRef , !lineRef));
<INITIAL>"static"                            => (Tokens.STATIC (!lineRef , !lineRef));
<INITIAL>"int"                               => (Tokens.INT (!lineRef , !lineRef));
<INITIAL>"bool"                              => (Tokens.BOOL (!lineRef , !lineRef));
<INITIAL>"string"                              => (Tokens.CHAR (!lineRef , !lineRef));
<INITIAL>"void"                              => (Tokens.VOID (!lineRef , !lineRef));
<INITIAL>"if"                                => (Tokens.IF (!lineRef , !lineRef));
<INITIAL>"else"                              => (Tokens.ELSE (!lineRef , !lineRef));
<INITIAL>"while"                             => (Tokens.WHILE (!lineRef , !lineRef));
<INITIAL>"for"                               => (Tokens.FOR (!lineRef , !lineRef));
<INITIAL>"return"                            => (Tokens.RETURN (!lineRef , !lineRef));
<INITIAL>"break"                             => (Tokens.BREAK (!lineRef , !lineRef));
<INITIAL>"continue"                          => (Tokens.CONTINUE (!lineRef , !lineRef));
<INITIAL>"+="                                => (Tokens.PLUSEQUAL (!lineRef , !lineRef));
<INITIAL>"-="                                => (Tokens.MINUSEQUAL (!lineRef , !lineRef));
<INITIAL>"*="                                => (Tokens.MULTEQUAL (!lineRef , !lineRef));
<INITIAL>"/="                                => (Tokens.DIVEQUAL (!lineRef , !lineRef));
<INITIAL>"++"                                => (Tokens.INC (!lineRef , !lineRef));
<INITIAL>"--"                                => (Tokens.DEC (!lineRef , !lineRef));
<INITIAL>"||"                                => (Tokens.OR (!lineRef , !lineRef));
<INITIAL>"&&"                                => (Tokens.AND (!lineRef , !lineRef));   
<INITIAL>"!"                                 => (Tokens.NOT (!lineRef , !lineRef));               
<INITIAL>"<="                                => (Tokens.LESSEQUAL (!lineRef , !lineRef));
<INITIAL>"<"                                 => (Tokens.LESS (!lineRef , !lineRef));
<INITIAL>">"                                 => (Tokens.GREATER (!lineRef , !lineRef));
<INITIAL>">="                                => (Tokens.GREATEREQUAL (!lineRef , !lineRef));
<INITIAL>"=="                                => (Tokens.EQUALEQUAL (!lineRef , !lineRef));
<INITIAL>"!="                                => (Tokens.NOTEQUAL (!lineRef , !lineRef));
<INITIAL>"+"                                 => (Tokens.PLUS (!lineRef , !lineRef));
<INITIAL>"-"                                 => (Tokens.MINUS (!lineRef , !lineRef));
<INITIAL>"*"                                 =>  (Tokens.MULT (!lineRef , !lineRef));
<INITIAL>"/"                                 => (Tokens.DIV (!lineRef , !lineRef));
<INITIAL>"%"                                 => (Tokens.MOD (!lineRef , !lineRef));
<INITIAL>"~"                                 => (Tokens.DASH (!lineRef , !lineRef));
<INITIAL>"<<"                                 => (Tokens.LLBRACKET (!lineRef , !lineRef));
<INITIAL>"cout"                                 => (Tokens.COUT (!lineRef , !lineRef));
<INITIAL>"true"                              => (Tokens.TRUE (!lineRef , !lineRef));
<INITIAL>"false"                             => (Tokens.FALSE (!lineRef , !lineRef));
<INITIAL>"//".*                              => (lex());
<INITIAL>[0-9]+                          => (Tokens.NUMCONST (yytext, !lineRef , !lineRef));
<INITIAL>[a-zA-Z_][a-zA-Z0-9_]*              => (Tokens.ID (yytext , !lineRef , !lineRef));
<INITIAL>"\""({newline} | [^\\"])*"\""                          => (Tokens.CHARCONST (yytext, !lineRef , !lineRef));

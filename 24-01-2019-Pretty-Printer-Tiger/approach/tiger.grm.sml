functor TigerLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : Tiger_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
(*#line 1.2 "tiger.grm"*)
(*#line 12.1 "tiger.grm.sml"*)
end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\007\000\000\000\
\\001\000\002\000\013\000\003\000\012\000\004\000\011\000\006\000\010\000\000\000\
\\001\000\002\000\013\000\003\000\012\000\004\000\011\000\009\000\024\000\
\\010\000\023\000\011\000\022\000\000\000\
\\001\000\005\000\000\000\000\000\
\\001\000\006\000\008\000\000\000\
\\001\000\008\000\021\000\000\000\
\\030\000\006\000\009\000\000\000\
\\031\000\000\000\
\\032\000\001\000\007\000\007\000\006\000\000\000\
\\033\000\000\000\
\\034\000\000\000\
\\035\000\002\000\013\000\003\000\012\000\004\000\011\000\000\000\
\\036\000\002\000\013\000\003\000\012\000\004\000\011\000\000\000\
\\037\000\002\000\013\000\003\000\012\000\004\000\011\000\000\000\
\\038\000\002\000\013\000\003\000\012\000\004\000\011\000\000\000\
\\039\000\000\000\
\\040\000\004\000\011\000\000\000\
\\041\000\004\000\011\000\000\000\
\\042\000\000\000\
\"
val actionRowNumbers =
"\008\000\004\000\006\000\001\000\
\\000\000\015\000\008\000\007\000\
\\008\000\000\000\000\000\000\000\
\\005\000\002\000\010\000\009\000\
\\018\000\017\000\016\000\000\000\
\\000\000\000\000\000\000\014\000\
\\013\000\012\000\011\000\003\000"
val gotoT =
"\
\\001\000\003\000\002\000\002\000\003\000\027\000\004\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\013\000\005\000\012\000\000\000\
\\000\000\
\\001\000\003\000\002\000\014\000\004\000\001\000\000\000\
\\000\000\
\\001\000\003\000\002\000\015\000\004\000\001\000\000\000\
\\001\000\016\000\000\000\
\\001\000\017\000\000\000\
\\001\000\018\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\023\000\000\000\
\\001\000\024\000\000\000\
\\001\000\025\000\000\000\
\\001\000\026\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 28
val numrules = 13
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit | CONST of  (string) | CONDITION of  (Ast.condition) | STATEMENT of  (Ast.program_string) | PROGRAM of  (Ast.program_string list) | EXPS of  (Ast.program_string list) | EXP of  (Ast.Expr)
end
type svalue = MlyValue.svalue
type result = Ast.program_string list
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn _ => false
val preferred_change : (term list * term list) list = 
nil
val noShift = 
fn (T 4) => true | _ => false
val showTerminal =
fn (T 0) => "CONST"
  | (T 1) => "PLUS"
  | (T 2) => "MINUS"
  | (T 3) => "MUL"
  | (T 4) => "EOF"
  | (T 5) => "NEWLINE"
  | (T 6) => "IF"
  | (T 7) => "THEN"
  | (T 8) => "GT"
  | (T 9) => "LT"
  | (T 10) => "EQ"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ (T 3) $$ (T 2) $$ (T 1)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.EXPS EXPS, EXPS1left, EXPS1right)) :: rest671)) => let val  result = MlyValue.PROGRAM ((*#line 41.29 "tiger.grm"*) EXPS (*#line 185.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, EXPS1left, EXPS1right), rest671)
end
|  ( 1, ( ( _, ( _, _, NEWLINE1right)) :: ( _, ( MlyValue.EXPS EXPS, EXPS1left, _)) :: rest671)) => let val  result = MlyValue.PROGRAM ((*#line 42.26 "tiger.grm"*) EXPS (*#line 189.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, EXPS1left, NEWLINE1right), rest671)
end
|  ( 2, ( rest671)) => let val  result = MlyValue.EXPS ((*#line 44.29 "tiger.grm"*) [] (*#line 193.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, defaultPos, defaultPos), rest671)
end
|  ( 3, ( ( _, ( MlyValue.EXPS EXPS, _, EXPS1right)) :: _ :: ( _, ( MlyValue.EXP EXP, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXPS ((*#line 45.26 "tiger.grm"*) Ast.expression_to_programString EXP :: EXPS   (*#line 197.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, EXP1left, EXPS1right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.EXPS EXPS, _, EXPS1right)) :: _ :: ( _, ( MlyValue.STATEMENT STATEMENT, STATEMENT1left, _)) :: rest671)) => let val  result = MlyValue.EXPS ((*#line 46.41 "tiger.grm"*)STATEMENT :: EXPS(*#line 201.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, STATEMENT1left, EXPS1right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.CONDITION ((*#line 49.31 "tiger.grm"*)Ast.greater EXP1 EXP2 (*#line 205.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, EXP1left, EXP2right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.CONDITION ((*#line 50.32 "tiger.grm"*)Ast.lesser EXP1 EXP2(*#line 209.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, EXP1left, EXP2right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.CONDITION ((*#line 51.32 "tiger.grm"*)Ast.equal EXP1 EXP2(*#line 213.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, EXP1left, EXP2right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.EXP EXP, _, EXP1right)) :: _ :: ( _, ( MlyValue.CONDITION CONDITION, _, _)) :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.STATEMENT ((*#line 54.40 "tiger.grm"*)Ast.if_then CONDITION EXP (*#line 217.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, IF1left, EXP1right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.CONST CONST, CONST1left, CONST1right)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 56.33 "tiger.grm"*) Ast.Const CONST     (*#line 221.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, CONST1left, CONST1right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 57.33 "tiger.grm"*) Ast.plus  EXP1 EXP2 (*#line 225.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 11, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 58.30 "tiger.grm"*) Ast.minus EXP1 EXP2 (*#line 229.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 12, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = MlyValue.EXP ((*#line 59.30 "tiger.grm"*) Ast.mul   EXP1 EXP2 (*#line 233.1 "tiger.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.PROGRAM x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a 
end
end
structure Tokens : Tiger_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun CONST (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(ParserData.MlyValue.CONST i,p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(ParserData.MlyValue.VOID,p1,p2))
fun MINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(ParserData.MlyValue.VOID,p1,p2))
fun MUL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(ParserData.MlyValue.VOID,p1,p2))
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(ParserData.MlyValue.VOID,p1,p2))
fun NEWLINE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(ParserData.MlyValue.VOID,p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(ParserData.MlyValue.VOID,p1,p2))
fun THEN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(ParserData.MlyValue.VOID,p1,p2))
fun GT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(ParserData.MlyValue.VOID,p1,p2))
fun LT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(ParserData.MlyValue.VOID,p1,p2))
fun EQ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(ParserData.MlyValue.VOID,p1,p2))
end
end

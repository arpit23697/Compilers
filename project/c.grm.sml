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
(*#line 1.2 "c.grm"*)
(*#line 12.1 "c.grm.sml"*)
end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\002\000\000\000\000\000\
\\001\000\003\000\015\000\000\000\
\\001\000\003\000\017\000\000\000\
\\001\000\003\000\043\000\004\000\102\000\005\000\135\000\007\000\134\000\
\\012\000\042\000\018\000\133\000\020\000\132\000\022\000\131\000\
\\023\000\130\000\024\000\129\000\034\000\041\000\047\000\040\000\
\\049\000\039\000\050\000\038\000\051\000\037\000\052\000\036\000\000\000\
\\001\000\003\000\043\000\004\000\102\000\007\000\134\000\012\000\042\000\
\\018\000\133\000\020\000\132\000\022\000\131\000\023\000\130\000\
\\024\000\129\000\034\000\041\000\047\000\040\000\049\000\039\000\
\\050\000\038\000\051\000\037\000\052\000\036\000\000\000\
\\001\000\003\000\043\000\007\000\140\000\012\000\042\000\034\000\041\000\
\\047\000\040\000\049\000\039\000\050\000\038\000\051\000\037\000\
\\052\000\036\000\000\000\
\\001\000\003\000\043\000\012\000\042\000\034\000\041\000\047\000\040\000\
\\049\000\039\000\050\000\038\000\051\000\037\000\052\000\036\000\000\000\
\\001\000\003\000\043\000\012\000\042\000\047\000\040\000\049\000\039\000\
\\050\000\038\000\051\000\037\000\052\000\036\000\000\000\
\\001\000\003\000\045\000\000\000\
\\001\000\003\000\074\000\000\000\
\\001\000\004\000\102\000\000\000\
\\001\000\006\000\020\000\007\000\019\000\000\000\
\\001\000\006\000\072\000\013\000\071\000\000\000\
\\001\000\006\000\072\000\013\000\076\000\000\000\
\\001\000\006\000\113\000\013\000\112\000\000\000\
\\001\000\007\000\136\000\000\000\
\\001\000\007\000\137\000\000\000\
\\001\000\007\000\138\000\000\000\
\\001\000\007\000\143\000\000\000\
\\001\000\010\000\075\000\000\000\
\\001\000\010\000\106\000\000\000\
\\001\000\010\000\115\000\000\000\
\\001\000\012\000\023\000\000\000\
\\001\000\012\000\141\000\000\000\
\\001\000\012\000\142\000\000\000\
\\001\000\013\000\098\000\000\000\
\\001\000\013\000\146\000\032\000\064\000\000\000\
\\001\000\013\000\147\000\032\000\064\000\000\000\
\\001\000\014\000\011\000\015\000\010\000\016\000\009\000\000\000\
\\001\000\014\000\011\000\015\000\010\000\016\000\009\000\017\000\008\000\000\000\
\\001\000\049\000\049\000\000\000\
\\153\000\014\000\011\000\015\000\010\000\016\000\009\000\017\000\008\000\000\000\
\\154\000\000\000\
\\155\000\000\000\
\\156\000\000\000\
\\157\000\000\000\
\\158\000\000\000\
\\159\000\000\000\
\\160\000\000\000\
\\161\000\008\000\018\000\000\000\
\\162\000\032\000\064\000\000\000\
\\163\000\009\000\022\000\000\000\
\\163\000\009\000\022\000\012\000\021\000\000\000\
\\164\000\000\000\
\\165\000\000\000\
\\166\000\000\000\
\\167\000\000\000\
\\168\000\000\000\
\\169\000\000\000\
\\170\000\000\000\
\\171\000\000\000\
\\172\000\014\000\011\000\015\000\010\000\016\000\009\000\000\000\
\\173\000\000\000\
\\174\000\009\000\104\000\000\000\
\\175\000\000\000\
\\176\000\000\000\
\\177\000\000\000\
\\178\000\000\000\
\\179\000\000\000\
\\180\000\000\000\
\\181\000\000\000\
\\182\000\000\000\
\\183\000\000\000\
\\184\000\000\000\
\\185\000\000\000\
\\186\000\014\000\011\000\015\000\010\000\016\000\009\000\000\000\
\\187\000\000\000\
\\188\000\000\000\
\\189\000\000\000\
\\190\000\019\000\150\000\000\000\
\\191\000\000\000\
\\192\000\000\000\
\\193\000\000\000\
\\194\000\000\000\
\\195\000\000\000\
\\196\000\000\000\
\\197\000\000\000\
\\198\000\000\000\
\\199\000\000\000\
\\200\000\000\000\
\\201\000\000\000\
\\202\000\000\000\
\\203\000\000\000\
\\204\000\032\000\064\000\000\000\
\\205\000\033\000\063\000\000\000\
\\206\000\033\000\063\000\000\000\
\\207\000\000\000\
\\208\000\000\000\
\\209\000\000\000\
\\210\000\000\000\
\\211\000\041\000\056\000\042\000\055\000\000\000\
\\212\000\041\000\056\000\042\000\055\000\000\000\
\\213\000\041\000\056\000\042\000\055\000\000\000\
\\214\000\041\000\056\000\042\000\055\000\000\000\
\\215\000\041\000\056\000\042\000\055\000\000\000\
\\216\000\041\000\056\000\042\000\055\000\000\000\
\\217\000\035\000\062\000\036\000\061\000\037\000\060\000\038\000\059\000\
\\039\000\058\000\040\000\057\000\041\000\056\000\042\000\055\000\000\000\
\\218\000\043\000\054\000\044\000\053\000\045\000\052\000\000\000\
\\219\000\043\000\054\000\044\000\053\000\045\000\052\000\000\000\
\\220\000\043\000\054\000\044\000\053\000\045\000\052\000\000\000\
\\221\000\000\000\
\\222\000\000\000\
\\223\000\000\000\
\\224\000\000\000\
\\225\000\000\000\
\\226\000\000\000\
\\227\000\000\000\
\\228\000\009\000\051\000\000\000\
\\228\000\009\000\051\000\025\000\097\000\026\000\096\000\027\000\095\000\
\\028\000\094\000\029\000\093\000\030\000\092\000\031\000\091\000\000\000\
\\229\000\012\000\070\000\000\000\
\\230\000\000\000\
\\231\000\000\000\
\\232\000\000\000\
\\233\000\000\000\
\\234\000\000\000\
\\235\000\003\000\043\000\012\000\042\000\034\000\041\000\047\000\040\000\
\\049\000\039\000\050\000\038\000\051\000\037\000\052\000\036\000\000\000\
\\236\000\000\000\
\\237\000\000\000\
\\238\000\000\000\
\\239\000\000\000\
\\240\000\000\000\
\\241\000\000\000\
\"
val actionRowNumbers =
"\029\000\035\000\001\000\034\000\
\\033\000\031\000\002\000\046\000\
\\045\000\044\000\039\000\037\000\
\\011\000\042\000\032\000\022\000\
\\006\000\036\000\008\000\051\000\
\\030\000\051\000\113\000\112\000\
\\106\000\107\000\105\000\103\000\
\\099\000\096\000\089\000\087\000\
\\085\000\040\000\121\000\120\000\
\\119\000\118\000\007\000\006\000\
\\006\000\109\000\038\000\041\000\
\\049\000\012\000\009\000\019\000\
\\013\000\006\000\007\000\007\000\
\\007\000\007\000\007\000\007\000\
\\007\000\007\000\007\000\007\000\
\\007\000\006\000\006\000\104\000\
\\088\000\108\000\083\000\025\000\
\\115\000\010\000\028\000\052\000\
\\053\000\043\000\010\000\020\000\
\\102\000\101\000\100\000\098\000\
\\097\000\095\000\094\000\093\000\
\\092\000\091\000\090\000\086\000\
\\084\000\082\000\081\000\006\000\
\\006\000\006\000\006\000\006\000\
\\111\000\014\000\116\000\047\000\
\\064\000\050\000\021\000\048\000\
\\110\000\080\000\079\000\078\000\
\\077\000\076\000\114\000\006\000\
\\065\000\054\000\117\000\003\000\
\\008\000\063\000\015\000\061\000\
\\060\000\059\000\058\000\057\000\
\\055\000\056\000\066\000\016\000\
\\017\000\005\000\023\000\024\000\
\\068\000\062\000\067\000\075\000\
\\074\000\018\000\072\000\006\000\
\\006\000\073\000\026\000\027\000\
\\004\000\004\000\071\000\069\000\
\\004\000\070\000\000\000"
val gotoT =
"\
\\001\000\150\000\002\000\005\000\003\000\004\000\004\000\003\000\
\\008\000\002\000\009\000\001\000\000\000\
\\000\000\
\\005\000\012\000\006\000\011\000\007\000\010\000\000\000\
\\000\000\
\\000\000\
\\003\000\014\000\004\000\003\000\008\000\002\000\009\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\024\000\033\000\025\000\032\000\026\000\031\000\027\000\030\000\
\\028\000\029\000\029\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\000\000\
\\006\000\042\000\007\000\010\000\000\000\
\\008\000\046\000\010\000\045\000\011\000\044\000\000\000\
\\000\000\
\\008\000\046\000\010\000\048\000\011\000\044\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\030\000\063\000\031\000\026\000\032\000\025\000\033\000\024\000\
\\034\000\023\000\036\000\022\000\000\000\
\\026\000\064\000\027\000\030\000\028\000\029\000\029\000\028\000\
\\030\000\027\000\031\000\026\000\032\000\025\000\033\000\024\000\
\\034\000\023\000\036\000\022\000\000\000\
\\023\000\067\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\012\000\071\000\000\000\
\\000\000\
\\000\000\
\\023\000\075\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\030\000\076\000\031\000\026\000\032\000\025\000\033\000\024\000\
\\034\000\023\000\036\000\022\000\000\000\
\\030\000\077\000\031\000\026\000\032\000\025\000\033\000\024\000\
\\034\000\023\000\036\000\022\000\000\000\
\\030\000\078\000\031\000\026\000\032\000\025\000\033\000\024\000\
\\034\000\023\000\036\000\022\000\000\000\
\\029\000\079\000\030\000\027\000\031\000\026\000\032\000\025\000\
\\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\029\000\080\000\030\000\027\000\031\000\026\000\032\000\025\000\
\\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\028\000\081\000\029\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\028\000\082\000\029\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\028\000\083\000\029\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\028\000\084\000\029\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\028\000\085\000\029\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\028\000\086\000\029\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\026\000\087\000\027\000\030\000\028\000\029\000\029\000\028\000\
\\030\000\027\000\031\000\026\000\032\000\025\000\033\000\024\000\
\\034\000\023\000\036\000\022\000\000\000\
\\025\000\088\000\026\000\031\000\027\000\030\000\028\000\029\000\
\\029\000\028\000\030\000\027\000\031\000\026\000\032\000\025\000\
\\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\023\000\098\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\035\000\097\000\036\000\022\000\000\000\
\\014\000\099\000\000\000\
\\008\000\046\000\011\000\101\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\014\000\103\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\023\000\105\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\023\000\106\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\023\000\107\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\023\000\108\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\023\000\109\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\015\000\112\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\023\000\114\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\004\000\117\000\008\000\116\000\016\000\115\000\000\000\
\\000\000\
\\000\000\
\\013\000\126\000\014\000\125\000\017\000\124\000\018\000\123\000\
\\019\000\122\000\020\000\121\000\021\000\120\000\022\000\119\000\
\\023\000\118\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\005\000\012\000\006\000\011\000\007\000\010\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\023\000\137\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\024\000\142\000\025\000\032\000\026\000\031\000\027\000\030\000\
\\028\000\029\000\029\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\024\000\143\000\025\000\032\000\026\000\031\000\027\000\030\000\
\\028\000\029\000\029\000\028\000\030\000\027\000\031\000\026\000\
\\032\000\025\000\033\000\024\000\034\000\023\000\036\000\022\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\013\000\146\000\014\000\125\000\017\000\124\000\018\000\123\000\
\\019\000\122\000\020\000\121\000\021\000\120\000\022\000\119\000\
\\023\000\118\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\013\000\147\000\014\000\125\000\017\000\124\000\018\000\123\000\
\\019\000\122\000\020\000\121\000\021\000\120\000\022\000\119\000\
\\023\000\118\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\000\000\
\\000\000\
\\013\000\149\000\014\000\125\000\017\000\124\000\018\000\123\000\
\\019\000\122\000\020\000\121\000\021\000\120\000\022\000\119\000\
\\023\000\118\000\024\000\066\000\025\000\032\000\026\000\031\000\
\\027\000\030\000\028\000\029\000\029\000\028\000\030\000\027\000\
\\031\000\026\000\032\000\065\000\033\000\024\000\034\000\023\000\
\\036\000\022\000\000\000\
\\000\000\
\\000\000\
\"
val numstates = 151
val numrules = 89
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
datatype svalue = VOID' | ntVOID of unit | CHARCONST of  (string) | NUMCONST of  (string) | ID of  (string) | constant of  (Ast.constant) | args of  (Ast.expression list) | call of  (Ast.call) | immutable of  (Ast.immutable) | mutable of  (Ast.mutable) | factor of  (Ast.factor) | unaryExpression of  (Ast.unaryExpression) | term of  (Ast.term) | sumExpression of  (Ast.sumExpression) | relExpression of  (Ast.relExpression) | unaryRelExpression of  (Ast.unaryRelExpression) | andExpression of  (Ast.andExpression) | simpleExpression of  (Ast.simpleExpression) | expression of  (Ast.expression) | continueStmt of  (Ast.continueStmt) | breakStmt of  (Ast.breakStmt) | returnStmt of  (Ast.returnStmt) | iterationStmt of  (Ast.iterationStmt) | selectionStmt of  (Ast.selectionStmt) | expressionStmt of  (Ast.expressionStmt) | statementList of  (Ast.statement list) | localDeclarations of  (Ast.localDeclarations) | compoundStmt of  (Ast.compoundStmt) | statement of  (Ast.statement) | paramID of  (Ast.paramID) | paramType of  (Ast.paramType) | params of  (Ast.paramType list) | funDeclaration of  (Ast.funDeclaration) | typeSpecifier of  (Ast.typeSpecifier) | varDeclID of  (Ast.varDeclID) | varDeclInitialize of  (Ast.varDeclInitialize) | varDeclList of  (Ast.varDeclInitialize list) | varDeclaration of  (Ast.varDeclaration) | declaration of  (Ast.declaration) | declarationList of  (Ast.declaration list) | program of  (Ast.program)
end
type svalue = MlyValue.svalue
type result = Ast.program
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
fn (T 1) => true | _ => false
val showTerminal =
fn (T 0) => "RECORD"
  | (T 1) => "EOF"
  | (T 2) => "ID"
  | (T 3) => "LEFTBRACE"
  | (T 4) => "RIGHTBRACE"
  | (T 5) => "COMMA"
  | (T 6) => "SEMICOLON"
  | (T 7) => "COLON"
  | (T 8) => "LEFTBRACKET"
  | (T 9) => "RIGHTBRACKET"
  | (T 10) => "STATIC"
  | (T 11) => "LPARA"
  | (T 12) => "RPARA"
  | (T 13) => "INT"
  | (T 14) => "BOOL"
  | (T 15) => "CHAR"
  | (T 16) => "VOID"
  | (T 17) => "IF"
  | (T 18) => "ELSE"
  | (T 19) => "WHILE"
  | (T 20) => "FOR"
  | (T 21) => "RETURN"
  | (T 22) => "BREAK"
  | (T 23) => "CONTINUE"
  | (T 24) => "EQUAL"
  | (T 25) => "PLUSEQUAL"
  | (T 26) => "MINUSEQUAL"
  | (T 27) => "MULTEQUAL"
  | (T 28) => "DIVEQUAL"
  | (T 29) => "INC"
  | (T 30) => "DEC"
  | (T 31) => "OR"
  | (T 32) => "AND"
  | (T 33) => "NOT"
  | (T 34) => "LESSEQUAL"
  | (T 35) => "LESS"
  | (T 36) => "GREATER"
  | (T 37) => "GREATEREQUAL"
  | (T 38) => "EQUALEQUAL"
  | (T 39) => "NOTEQUAL"
  | (T 40) => "PLUS"
  | (T 41) => "MINUS"
  | (T 42) => "MULT"
  | (T 43) => "DIV"
  | (T 44) => "MOD"
  | (T 45) => "QUES"
  | (T 46) => "DASH"
  | (T 47) => "STAR"
  | (T 48) => "NUMCONST"
  | (T 49) => "CHARCONST"
  | (T 50) => "TRUE"
  | (T 51) => "FALSE"
  | (T 52) => "iff"
  | (T 53) => "c"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID'
end
val terms : term list = nil
 $$ (T 53) $$ (T 52) $$ (T 51) $$ (T 50) $$ (T 47) $$ (T 46) $$ (T 45) $$ (T 44) $$ (T 43) $$ (T 42) $$ (T 41) $$ (T 40) $$ (T 39) $$ (T 38) $$ (T 37) $$ (T 36) $$ (T 35) $$ (T 34) $$ (T 33) $$ (T 32) $$ (T 31) $$ (T 30) $$ (T 29) $$ (T 28) $$ (T 27) $$ (T 26) $$ (T 25) $$ (T 24) $$ (T 23) $$ (T 22) $$ (T 21) $$ (T 20) $$ (T 19) $$ (T 18) $$ (T 17) $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11) $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ (T 3) $$ (T 1) $$ (T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.declarationList declarationList, declarationList1left, declarationList1right)) :: rest671)) => let val  result = MlyValue.program ((*#line 130.66 "c.grm"*) Ast.declL(declarationList) (*#line 572.1 "c.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, declarationList1left, declarationList1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.declaration declaration, _, declaration1right)) :: ( _, ( MlyValue.declarationList declarationList, declarationList1left, _)) :: rest671)) => let val  result = MlyValue.declarationList ((*#line 132.66 "c.grm"*) declarationList @ [declaration] (*#line 576.1 "c.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, declarationList1left, declaration1right), rest671)
end
|  ( 2, ( ( _, ( MlyValue.declaration declaration, declaration1left, declaration1right)) :: rest671)) => let val  result = MlyValue.declarationList ((*#line 133.66 "c.grm"*) [declaration] (*#line 580.1 "c.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, declaration1left, declaration1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.varDeclaration varDeclaration, varDeclaration1left, varDeclaration1right)) :: rest671)) => let val  result = MlyValue.declaration ((*#line 135.66 "c.grm"*)Ast.variableDeclaration (varDeclaration) (*#line 584.1 "c.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, varDeclaration1left, varDeclaration1right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.funDeclaration funDeclaration, funDeclaration1left, funDeclaration1right)) :: rest671)) => let val  result = MlyValue.declaration ((*#line 136.66 "c.grm"*)Ast.functionDeclaration (funDeclaration) (*#line 588.1 "c.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, funDeclaration1left, funDeclaration1right), rest671)
end
|  ( 5, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( MlyValue.varDeclList varDeclList, _, _)) :: ( _, ( MlyValue.typeSpecifier typeSpecifier, typeSpecifier1left, _)) :: rest671)) => let val  result = MlyValue.varDeclaration ((*#line 139.79 "c.grm"*)Ast.vDecl (typeSpecifier , varDeclList)(*#line 592.1 "c.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, typeSpecifier1left, SEMICOLON1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.varDeclInitialize varDeclInitialize, varDeclInitialize1left, varDeclInitialize1right)) :: rest671)) => let val  result = MlyValue.varDeclList ((*#line 141.73 "c.grm"*)[varDeclInitialize](*#line 596.1 "c.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, varDeclInitialize1left, varDeclInitialize1right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.varDeclInitialize varDeclInitialize, _, varDeclInitialize1right)) :: _ :: ( _, ( MlyValue.varDeclList varDeclList, varDeclList1left, _)) :: rest671)) => let val  result = MlyValue.varDeclList ((*#line 142.74 "c.grm"*) varDeclList @ [varDeclInitialize] (*#line 600.1 "c.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, varDeclList1left, varDeclInitialize1right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.varDeclID varDeclID, varDeclID1left, varDeclID1right)) :: rest671)) => let val  result = MlyValue.varDeclInitialize ((*#line 145.70 "c.grm"*)Ast.declarationOnlyID (varDeclID) (*#line 604.1 "c.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, varDeclID1left, varDeclID1right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.simpleExpression simpleExpression, _, simpleExpression1right)) :: _ :: ( _, ( MlyValue.varDeclID varDeclID, varDeclID1left, _)) :: rest671)) => let val  result = MlyValue.varDeclInitialize ((*#line 146.70 "c.grm"*)Ast.declarationAssignment (varDeclID , simpleExpression)(*#line 608.1 "c.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, varDeclID1left, simpleExpression1right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.varDeclID ((*#line 148.69 "c.grm"*)Ast.vID (ID)(*#line 612.1 "c.grm.sml"*)
)
 in ( LrTable.NT 6, ( result, ID1left, ID1right), rest671)
end
|  ( 11, ( ( _, ( _, _, RIGHTBRACKET1right)) :: ( _, ( MlyValue.NUMCONST NUMCONST, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.varDeclID ((*#line 149.70 "c.grm"*)Ast.arrayLike (ID , NUMCONST)(*#line 616.1 "c.grm.sml"*)
)
 in ( LrTable.NT 6, ( result, ID1left, RIGHTBRACKET1right), rest671)
end
|  ( 12, ( ( _, ( _, INT1left, INT1right)) :: rest671)) => let val  result = MlyValue.typeSpecifier ((*#line 151.64 "c.grm"*)Ast.integer(*#line 620.1 "c.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, INT1left, INT1right), rest671)
end
|  ( 13, ( ( _, ( _, BOOL1left, BOOL1right)) :: rest671)) => let val  result = MlyValue.typeSpecifier ((*#line 152.70 "c.grm"*)Ast.boolean(*#line 624.1 "c.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, BOOL1left, BOOL1right), rest671)
end
|  ( 14, ( ( _, ( _, CHAR1left, CHAR1right)) :: rest671)) => let val  result = MlyValue.typeSpecifier ((*#line 153.70 "c.grm"*)Ast.character(*#line 628.1 "c.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, CHAR1left, CHAR1right), rest671)
end
|  ( 15, ( ( _, ( MlyValue.compoundStmt compoundStmt, _, compoundStmt1right)) :: _ :: ( _, ( MlyValue.params params, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( MlyValue.typeSpecifier typeSpecifier, typeSpecifier1left, _)) :: rest671)) => let val  result = MlyValue.funDeclaration ((*#line 157.74 "c.grm"*)Ast.functionReturn (typeSpecifier , ID , params , compoundStmt)(*#line 632.1 "c.grm.sml"*)
)
 in ( LrTable.NT 8, ( result, typeSpecifier1left, compoundStmt1right), rest671)
end
|  ( 16, ( ( _, ( MlyValue.compoundStmt compoundStmt, _, compoundStmt1right)) :: _ :: ( _, ( MlyValue.params params, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, VOID1left, _)) :: rest671)) => let val  result = MlyValue.funDeclaration ((*#line 158.73 "c.grm"*)Ast.functionVoid (ID , params , compoundStmt)(*#line 636.1 "c.grm.sml"*)
)
 in ( LrTable.NT 8, ( result, VOID1left, compoundStmt1right), rest671)
end
|  ( 17, ( ( _, ( MlyValue.paramType paramType, paramType1left, paramType1right)) :: rest671)) => let val  result = MlyValue.params ((*#line 160.66 "c.grm"*)[paramType](*#line 640.1 "c.grm.sml"*)
)
 in ( LrTable.NT 9, ( result, paramType1left, paramType1right), rest671)
end
|  ( 18, ( ( _, ( MlyValue.paramType paramType, _, paramType1right)) :: _ :: ( _, ( MlyValue.params params, params1left, _)) :: rest671)) => let val  result = MlyValue.params ((*#line 161.59 "c.grm"*) params @ [paramType] (*#line 644.1 "c.grm.sml"*)
)
 in ( LrTable.NT 9, ( result, params1left, paramType1right), rest671)
end
|  ( 19, ( rest671)) => let val  result = MlyValue.params ((*#line 162.70 "c.grm"*) [] (*#line 648.1 "c.grm.sml"*)
)
 in ( LrTable.NT 9, ( result, defaultPos, defaultPos), rest671)
end
|  ( 20, ( ( _, ( MlyValue.paramID paramID, _, paramID1right)) :: ( _, ( MlyValue.typeSpecifier typeSpecifier, typeSpecifier1left, _)) :: rest671)) => let val  result = MlyValue.paramType ((*#line 164.62 "c.grm"*)Ast.parameter(typeSpecifier , paramID)(*#line 652.1 "c.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, typeSpecifier1left, paramID1right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.paramID ((*#line 166.70 "c.grm"*)Ast.normalID (ID)(*#line 656.1 "c.grm.sml"*)
)
 in ( LrTable.NT 11, ( result, ID1left, ID1right), rest671)
end
|  ( 22, ( ( _, ( _, _, RIGHTBRACKET1right)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.paramID ((*#line 167.70 "c.grm"*)Ast.arrayID (ID)(*#line 660.1 "c.grm.sml"*)
)
 in ( LrTable.NT 11, ( result, ID1left, RIGHTBRACKET1right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.expressionStmt expressionStmt, expressionStmt1left, expressionStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 170.70 "c.grm"*)Ast.eStatement (expressionStmt)(*#line 664.1 "c.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, expressionStmt1left, expressionStmt1right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.compoundStmt compoundStmt, compoundStmt1left, compoundStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 171.70 "c.grm"*)Ast.cStatement (compoundStmt)(*#line 668.1 "c.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, compoundStmt1left, compoundStmt1right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.selectionStmt selectionStmt, selectionStmt1left, selectionStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 172.70 "c.grm"*)Ast.sStatement (selectionStmt)(*#line 672.1 "c.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, selectionStmt1left, selectionStmt1right), rest671)
end
|  ( 26, ( ( _, ( MlyValue.iterationStmt iterationStmt, iterationStmt1left, iterationStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 173.70 "c.grm"*)Ast.iStatement (iterationStmt)(*#line 676.1 "c.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, iterationStmt1left, iterationStmt1right), rest671)
end
|  ( 27, ( ( _, ( MlyValue.returnStmt returnStmt, returnStmt1left, returnStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 174.70 "c.grm"*)Ast.rStatement (returnStmt)(*#line 680.1 "c.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, returnStmt1left, returnStmt1right), rest671)
end
|  ( 28, ( ( _, ( MlyValue.breakStmt breakStmt, breakStmt1left, breakStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 175.70 "c.grm"*)Ast.bStatement (breakStmt)(*#line 684.1 "c.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, breakStmt1left, breakStmt1right), rest671)
end
|  ( 29, ( ( _, ( MlyValue.continueStmt continueStmt, continueStmt1left, continueStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 176.71 "c.grm"*)Ast.conStatement (continueStmt)(*#line 688.1 "c.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, continueStmt1left, continueStmt1right), rest671)
end
|  ( 30, ( ( _, ( _, _, RIGHTBRACE1right)) :: ( _, ( MlyValue.statementList statementList, _, _)) :: ( _, ( MlyValue.localDeclarations localDeclarations, _, _)) :: ( _, ( _, LEFTBRACE1left, _)) :: rest671)) => let val  result = MlyValue.compoundStmt ((*#line 178.72 "c.grm"*)Ast.statementWithBrace (localDeclarations , statementList)(*#line 692.1 "c.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, LEFTBRACE1left, RIGHTBRACE1right), rest671)
end
|  ( 31, ( ( _, ( MlyValue.varDeclaration varDeclaration, _, varDeclaration1right)) :: ( _, ( MlyValue.localDeclarations localDeclarations, localDeclarations1left, _)) :: rest671)) => let val  result = MlyValue.localDeclarations ((*#line 180.64 "c.grm"*)Ast.declIn (localDeclarations , varDeclaration) (*#line 696.1 "c.grm.sml"*)
)
 in ( LrTable.NT 14, ( result, localDeclarations1left, varDeclaration1right), rest671)
end
|  ( 32, ( rest671)) => let val  result = MlyValue.localDeclarations ((*#line 181.70 "c.grm"*)Ast.emptyDeclIn(*#line 700.1 "c.grm.sml"*)
)
 in ( LrTable.NT 14, ( result, defaultPos, defaultPos), rest671)
end
|  ( 33, ( rest671)) => let val  result = MlyValue.statementList ((*#line 183.72 "c.grm"*)[] (*#line 704.1 "c.grm.sml"*)
)
 in ( LrTable.NT 15, ( result, defaultPos, defaultPos), rest671)
end
|  ( 34, ( ( _, ( MlyValue.statement statement, _, statement1right)) :: ( _, ( MlyValue.statementList statementList, statementList1left, _)) :: rest671)) => let val  result = MlyValue.statementList ((*#line 184.64 "c.grm"*)statementList @ [statement](*#line 708.1 "c.grm.sml"*)
)
 in ( LrTable.NT 15, ( result, statementList1left, statement1right), rest671)
end
|  ( 35, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( MlyValue.expression expression, expression1left, _)) :: rest671)) => let val  result = MlyValue.expressionStmt ((*#line 187.70 "c.grm"*)Ast.basicExpression (expression)(*#line 712.1 "c.grm.sml"*)
)
 in ( LrTable.NT 16, ( result, expression1left, SEMICOLON1right), rest671)
end
|  ( 36, ( ( _, ( _, SEMICOLON1left, SEMICOLON1right)) :: rest671)) => let val  result = MlyValue.expressionStmt ((*#line 188.70 "c.grm"*)Ast.semicolon (*#line 716.1 "c.grm.sml"*)
)
 in ( LrTable.NT 16, ( result, SEMICOLON1left, SEMICOLON1right), rest671)
end
|  ( 37, ( ( _, ( MlyValue.statement statement, _, statement1right)) :: _ :: ( _, ( MlyValue.simpleExpression simpleExpression, _, _)) :: _ :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.selectionStmt ((*#line 190.78 "c.grm"*)Ast.IF (simpleExpression , statement)(*#line 720.1 "c.grm.sml"*)
)
 in ( LrTable.NT 17, ( result, IF1left, statement1right), rest671)
end
|  ( 38, ( ( _, ( MlyValue.statement statement2, _, statement2right)) :: _ :: ( _, ( MlyValue.statement statement1, _, _)) :: _ :: ( _, ( MlyValue.simpleExpression simpleExpression, _, _)) :: _ :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.selectionStmt ((*#line 191.74 "c.grm"*)Ast.IF_ELSE (simpleExpression , statement1 , statement2)(*#line 724.1 "c.grm.sml"*)
)
 in ( LrTable.NT 17, ( result, IF1left, statement2right), rest671)
end
|  ( 39, ( ( _, ( MlyValue.statement statement, _, statement1right)) :: _ :: ( _, ( MlyValue.simpleExpression simpleExpression, _, _)) :: _ :: ( _, ( _, WHILE1left, _)) :: rest671)) => let val  result = MlyValue.iterationStmt ((*#line 193.71 "c.grm"*)Ast.WHILE(simpleExpression , statement)(*#line 728.1 "c.grm.sml"*)
)
 in ( LrTable.NT 18, ( result, WHILE1left, statement1right), rest671)
end
|  ( 40, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( _, RETURN1left, _)) :: rest671)) => let val  result = MlyValue.returnStmt ((*#line 195.71 "c.grm"*)Ast.returnNoValue(*#line 732.1 "c.grm.sml"*)
)
 in ( LrTable.NT 19, ( result, RETURN1left, SEMICOLON1right), rest671)
end
|  ( 41, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( MlyValue.expression expression, _, _)) :: ( _, ( _, RETURN1left, _)) :: rest671)) => let val  result = MlyValue.returnStmt ((*#line 196.70 "c.grm"*)Ast.returnValue (expression)(*#line 736.1 "c.grm.sml"*)
)
 in ( LrTable.NT 19, ( result, RETURN1left, SEMICOLON1right), rest671)
end
|  ( 42, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( _, BREAK1left, _)) :: rest671)) => let val  result = MlyValue.breakStmt ((*#line 198.74 "c.grm"*)Ast.BREAK(*#line 740.1 "c.grm.sml"*)
)
 in ( LrTable.NT 20, ( result, BREAK1left, SEMICOLON1right), rest671)
end
|  ( 43, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( _, CONTINUE1left, _)) :: rest671)) => let val  result = MlyValue.continueStmt ((*#line 199.74 "c.grm"*)Ast.CONTINUE(*#line 744.1 "c.grm.sml"*)
)
 in ( LrTable.NT 21, ( result, CONTINUE1left, SEMICOLON1right), rest671)
end
|  ( 44, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 203.70 "c.grm"*)Ast.assign (mutable , expression)(*#line 748.1 "c.grm.sml"*)
)
 in ( LrTable.NT 22, ( result, mutable1left, expression1right), rest671)
end
|  ( 45, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 204.70 "c.grm"*)Ast.assignPlus (mutable , expression)(*#line 752.1 "c.grm.sml"*)
)
 in ( LrTable.NT 22, ( result, mutable1left, expression1right), rest671)
end
|  ( 46, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 205.70 "c.grm"*)Ast.assignMinus (mutable , expression)(*#line 756.1 "c.grm.sml"*)
)
 in ( LrTable.NT 22, ( result, mutable1left, expression1right), rest671)
end
|  ( 47, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 206.70 "c.grm"*)Ast.assignMult (mutable , expression)(*#line 760.1 "c.grm.sml"*)
)
 in ( LrTable.NT 22, ( result, mutable1left, expression1right), rest671)
end
|  ( 48, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 207.70 "c.grm"*)Ast.assignDiv (mutable , expression)(*#line 764.1 "c.grm.sml"*)
)
 in ( LrTable.NT 22, ( result, mutable1left, expression1right), rest671)
end
|  ( 49, ( ( _, ( _, _, INC1right)) :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 208.70 "c.grm"*)Ast.increment (mutable)(*#line 768.1 "c.grm.sml"*)
)
 in ( LrTable.NT 22, ( result, mutable1left, INC1right), rest671)
end
|  ( 50, ( ( _, ( _, _, DEC1right)) :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 209.70 "c.grm"*)Ast.decrement (mutable)(*#line 772.1 "c.grm.sml"*)
)
 in ( LrTable.NT 22, ( result, mutable1left, DEC1right), rest671)
end
|  ( 51, ( ( _, ( MlyValue.simpleExpression simpleExpression, simpleExpression1left, simpleExpression1right)) :: rest671)) => let val  result = MlyValue.expression ((*#line 210.70 "c.grm"*)Ast.plainExpression (simpleExpression)(*#line 776.1 "c.grm.sml"*)
)
 in ( LrTable.NT 22, ( result, simpleExpression1left, simpleExpression1right), rest671)
end
|  ( 52, ( ( _, ( MlyValue.andExpression andExpression, _, andExpression1right)) :: _ :: ( _, ( MlyValue.simpleExpression simpleExpression, simpleExpression1left, _)) :: rest671)) => let val  result = MlyValue.simpleExpression ((*#line 212.70 "c.grm"*)Ast.or(simpleExpression , andExpression)(*#line 780.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, simpleExpression1left, andExpression1right), rest671)
end
|  ( 53, ( ( _, ( MlyValue.andExpression andExpression, andExpression1left, andExpression1right)) :: rest671)) => let val  result = MlyValue.simpleExpression ((*#line 213.70 "c.grm"*)Ast.noOr (andExpression) (*#line 784.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, andExpression1left, andExpression1right), rest671)
end
|  ( 54, ( ( _, ( MlyValue.unaryRelExpression unaryRelExpression, _, unaryRelExpression1right)) :: _ :: ( _, ( MlyValue.andExpression andExpression, andExpression1left, _)) :: rest671)) => let val  result = MlyValue.andExpression ((*#line 215.70 "c.grm"*)Ast.simpleAnd (andExpression , unaryRelExpression)(*#line 788.1 "c.grm.sml"*)
)
 in ( LrTable.NT 24, ( result, andExpression1left, unaryRelExpression1right), rest671)
end
|  ( 55, ( ( _, ( MlyValue.unaryRelExpression unaryRelExpression, unaryRelExpression1left, unaryRelExpression1right)) :: rest671)) => let val  result = MlyValue.andExpression ((*#line 216.70 "c.grm"*)Ast.uExpr (unaryRelExpression)(*#line 792.1 "c.grm.sml"*)
)
 in ( LrTable.NT 24, ( result, unaryRelExpression1left, unaryRelExpression1right), rest671)
end
|  ( 56, ( ( _, ( MlyValue.unaryRelExpression unaryRelExpression, _, unaryRelExpression1right)) :: ( _, ( _, NOT1left, _)) :: rest671)) => let val  result = MlyValue.unaryRelExpression ((*#line 218.70 "c.grm"*)Ast.not (unaryRelExpression)(*#line 796.1 "c.grm.sml"*)
)
 in ( LrTable.NT 25, ( result, NOT1left, unaryRelExpression1right), rest671)
end
|  ( 57, ( ( _, ( MlyValue.relExpression relExpression, relExpression1left, relExpression1right)) :: rest671)) => let val  result = MlyValue.unaryRelExpression ((*#line 219.71 "c.grm"*)Ast.rExpr (relExpression)(*#line 800.1 "c.grm.sml"*)
)
 in ( LrTable.NT 25, ( result, relExpression1left, relExpression1right), rest671)
end
|  ( 58, ( ( _, ( _, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 221.78 "c.grm"*)Ast.relExp (sumExpression , Ast.LTE , sumExpression )(*#line 804.1 "c.grm.sml"*)
)
 in ( LrTable.NT 26, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 59, ( ( _, ( _, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 222.79 "c.grm"*)Ast.relExp (sumExpression , Ast.LT , sumExpression )(*#line 808.1 "c.grm.sml"*)
)
 in ( LrTable.NT 26, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 60, ( ( _, ( _, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 223.78 "c.grm"*)Ast.relExp (sumExpression , Ast.GTE , sumExpression )(*#line 812.1 "c.grm.sml"*)
)
 in ( LrTable.NT 26, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 61, ( ( _, ( _, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 224.78 "c.grm"*)Ast.relExp (sumExpression , Ast.GT , sumExpression )(*#line 816.1 "c.grm.sml"*)
)
 in ( LrTable.NT 26, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 62, ( ( _, ( _, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 225.78 "c.grm"*)Ast.relExp (sumExpression , Ast.EQ , sumExpression )(*#line 820.1 "c.grm.sml"*)
)
 in ( LrTable.NT 26, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 63, ( ( _, ( _, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 226.78 "c.grm"*)Ast.relExp (sumExpression , Ast.NEQ , sumExpression )(*#line 824.1 "c.grm.sml"*)
)
 in ( LrTable.NT 26, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 64, ( ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, sumExpression1right)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 227.79 "c.grm"*)Ast.noRel (sumExpression)(*#line 828.1 "c.grm.sml"*)
)
 in ( LrTable.NT 26, ( result, sumExpression1left, sumExpression1right), rest671)
end
|  ( 65, ( ( _, ( MlyValue.term term, _, term1right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.sumExpression ((*#line 229.77 "c.grm"*)Ast.sumExp (sumExpression , Ast.PLUS , term)(*#line 832.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, sumExpression1left, term1right), rest671)
end
|  ( 66, ( ( _, ( MlyValue.term term, _, term1right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.sumExpression ((*#line 230.78 "c.grm"*)Ast.sumExp (sumExpression , Ast.MINUS , term)(*#line 836.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, sumExpression1left, term1right), rest671)
end
|  ( 67, ( ( _, ( MlyValue.term term, term1left, term1right)) :: rest671)) => let val  result = MlyValue.sumExpression ((*#line 231.78 "c.grm"*)Ast.noSum (term)(*#line 840.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, term1left, term1right), rest671)
end
|  ( 68, ( ( _, ( MlyValue.unaryExpression unaryExpression, _, unaryExpression1right)) :: _ :: ( _, ( MlyValue.term term, term1left, _)) :: rest671)) => let val  result = MlyValue.term ((*#line 233.77 "c.grm"*)Ast.multExp (term , Ast.MULT , unaryExpression)(*#line 844.1 "c.grm.sml"*)
)
 in ( LrTable.NT 28, ( result, term1left, unaryExpression1right), rest671)
end
|  ( 69, ( ( _, ( MlyValue.unaryExpression unaryExpression, _, unaryExpression1right)) :: _ :: ( _, ( MlyValue.term term, term1left, _)) :: rest671)) => let val  result = MlyValue.term ((*#line 234.77 "c.grm"*)Ast.multExp (term , Ast.DIV , unaryExpression)(*#line 848.1 "c.grm.sml"*)
)
 in ( LrTable.NT 28, ( result, term1left, unaryExpression1right), rest671)
end
|  ( 70, ( ( _, ( MlyValue.unaryExpression unaryExpression, _, unaryExpression1right)) :: _ :: ( _, ( MlyValue.term term, term1left, _)) :: rest671)) => let val  result = MlyValue.term ((*#line 235.77 "c.grm"*)Ast.multExp (term , Ast.MOD , unaryExpression)(*#line 852.1 "c.grm.sml"*)
)
 in ( LrTable.NT 28, ( result, term1left, unaryExpression1right), rest671)
end
|  ( 71, ( ( _, ( MlyValue.unaryExpression unaryExpression, unaryExpression1left, unaryExpression1right)) :: rest671)) => let val  result = MlyValue.term ((*#line 236.77 "c.grm"*)Ast.noMult (unaryExpression)(*#line 856.1 "c.grm.sml"*)
)
 in ( LrTable.NT 28, ( result, unaryExpression1left, unaryExpression1right), rest671)
end
|  ( 72, ( ( _, ( MlyValue.unaryExpression unaryExpression, _, unaryExpression1right)) :: ( _, ( _, DASH1left, _)) :: rest671)) => let val  result = MlyValue.unaryExpression ((*#line 238.76 "c.grm"*)Ast.uExp (Ast.DASH , unaryExpression)(*#line 860.1 "c.grm.sml"*)
)
 in ( LrTable.NT 29, ( result, DASH1left, unaryExpression1right), rest671)
end
|  ( 73, ( ( _, ( MlyValue.factor factor, factor1left, factor1right)) :: rest671)) => let val  result = MlyValue.unaryExpression ((*#line 239.77 "c.grm"*)Ast.noUnary (factor)(*#line 864.1 "c.grm.sml"*)
)
 in ( LrTable.NT 29, ( result, factor1left, factor1right), rest671)
end
|  ( 74, ( ( _, ( MlyValue.immutable immutable, immutable1left, immutable1right)) :: rest671)) => let val  result = MlyValue.factor ((*#line 241.77 "c.grm"*)Ast.immut (immutable)(*#line 868.1 "c.grm.sml"*)
)
 in ( LrTable.NT 30, ( result, immutable1left, immutable1right), rest671)
end
|  ( 75, ( ( _, ( MlyValue.mutable mutable, mutable1left, mutable1right)) :: rest671)) => let val  result = MlyValue.factor ((*#line 242.77 "c.grm"*)Ast.mut (mutable)(*#line 872.1 "c.grm.sml"*)
)
 in ( LrTable.NT 30, ( result, mutable1left, mutable1right), rest671)
end
|  ( 76, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.mutable ((*#line 244.84 "c.grm"*)Ast.mID (ID)(*#line 876.1 "c.grm.sml"*)
)
 in ( LrTable.NT 31, ( result, ID1left, ID1right), rest671)
end
|  ( 77, ( ( _, ( _, _, RIGHTBRACKET1right)) :: ( _, ( MlyValue.expression expression, _, _)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.mutable ((*#line 245.77 "c.grm"*)Ast.mArray (mutable , expression )(*#line 880.1 "c.grm.sml"*)
)
 in ( LrTable.NT 31, ( result, mutable1left, RIGHTBRACKET1right), rest671)
end
|  ( 78, ( ( _, ( _, _, RPARA1right)) :: ( _, ( MlyValue.expression expression, _, _)) :: ( _, ( _, LPARA1left, _)) :: rest671)) => let val  result = MlyValue.immutable ((*#line 248.78 "c.grm"*)Ast.paranthesis(expression)(*#line 884.1 "c.grm.sml"*)
)
 in ( LrTable.NT 32, ( result, LPARA1left, RPARA1right), rest671)
end
|  ( 79, ( ( _, ( MlyValue.call call, call1left, call1right)) :: rest671)) => let val  result = MlyValue.immutable ((*#line 249.78 "c.grm"*)Ast.c (call)(*#line 888.1 "c.grm.sml"*)
)
 in ( LrTable.NT 32, ( result, call1left, call1right), rest671)
end
|  ( 80, ( ( _, ( MlyValue.constant constant, constant1left, constant1right)) :: rest671)) => let val  result = MlyValue.immutable ((*#line 250.78 "c.grm"*)Ast.const (constant)(*#line 892.1 "c.grm.sml"*)
)
 in ( LrTable.NT 32, ( result, constant1left, constant1right), rest671)
end
|  ( 81, ( ( _, ( _, _, RPARA1right)) :: ( _, ( MlyValue.args args, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.call ((*#line 252.78 "c.grm"*)Ast.callArgs (ID , args)(*#line 896.1 "c.grm.sml"*)
)
 in ( LrTable.NT 33, ( result, ID1left, RPARA1right), rest671)
end
|  ( 82, ( rest671)) => let val  result = MlyValue.args ((*#line 254.77 "c.grm"*)[](*#line 900.1 "c.grm.sml"*)
)
 in ( LrTable.NT 34, ( result, defaultPos, defaultPos), rest671)
end
|  ( 83, ( ( _, ( MlyValue.expression expression, expression1left, expression1right)) :: rest671)) => let val  result = MlyValue.args ((*#line 255.78 "c.grm"*)[expression](*#line 904.1 "c.grm.sml"*)
)
 in ( LrTable.NT 34, ( result, expression1left, expression1right), rest671)
end
|  ( 84, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.args args, args1left, _)) :: rest671)) => let val  result = MlyValue.args ((*#line 256.78 "c.grm"*)args @ [expression](*#line 908.1 "c.grm.sml"*)
)
 in ( LrTable.NT 34, ( result, args1left, expression1right), rest671)
end
|  ( 85, ( ( _, ( MlyValue.NUMCONST NUMCONST, NUMCONST1left, NUMCONST1right)) :: rest671)) => let val  result = MlyValue.constant ((*#line 258.82 "c.grm"*)Ast.number(NUMCONST)(*#line 912.1 "c.grm.sml"*)
)
 in ( LrTable.NT 35, ( result, NUMCONST1left, NUMCONST1right), rest671)
end
|  ( 86, ( ( _, ( MlyValue.CHARCONST CHARCONST, CHARCONST1left, CHARCONST1right)) :: rest671)) => let val  result = MlyValue.constant ((*#line 259.82 "c.grm"*)Ast.charConst (CHARCONST)(*#line 916.1 "c.grm.sml"*)
)
 in ( LrTable.NT 35, ( result, CHARCONST1left, CHARCONST1right), rest671)
end
|  ( 87, ( ( _, ( _, TRUE1left, TRUE1right)) :: rest671)) => let val  result = MlyValue.constant ((*#line 260.82 "c.grm"*)Ast.trueValue(*#line 920.1 "c.grm.sml"*)
)
 in ( LrTable.NT 35, ( result, TRUE1left, TRUE1right), rest671)
end
|  ( 88, ( ( _, ( _, FALSE1left, FALSE1right)) :: rest671)) => let val  result = MlyValue.constant ((*#line 261.82 "c.grm"*)Ast.falseValue(*#line 924.1 "c.grm.sml"*)
)
 in ( LrTable.NT 35, ( result, FALSE1left, FALSE1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID'
val extract = fn a => (fn MlyValue.program x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a 
end
end
structure Tokens : Tiger_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun RECORD (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(ParserData.MlyValue.VOID',p1,p2))
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(ParserData.MlyValue.VOID',p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(ParserData.MlyValue.ID i,p1,p2))
fun LEFTBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(ParserData.MlyValue.VOID',p1,p2))
fun RIGHTBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(ParserData.MlyValue.VOID',p1,p2))
fun COMMA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(ParserData.MlyValue.VOID',p1,p2))
fun SEMICOLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(ParserData.MlyValue.VOID',p1,p2))
fun COLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(ParserData.MlyValue.VOID',p1,p2))
fun LEFTBRACKET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(ParserData.MlyValue.VOID',p1,p2))
fun RIGHTBRACKET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(ParserData.MlyValue.VOID',p1,p2))
fun STATIC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(ParserData.MlyValue.VOID',p1,p2))
fun LPARA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(ParserData.MlyValue.VOID',p1,p2))
fun RPARA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(ParserData.MlyValue.VOID',p1,p2))
fun INT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(ParserData.MlyValue.VOID',p1,p2))
fun BOOL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(ParserData.MlyValue.VOID',p1,p2))
fun CHAR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(ParserData.MlyValue.VOID',p1,p2))
fun VOID (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(ParserData.MlyValue.VOID',p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(ParserData.MlyValue.VOID',p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(ParserData.MlyValue.VOID',p1,p2))
fun WHILE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(ParserData.MlyValue.VOID',p1,p2))
fun FOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(ParserData.MlyValue.VOID',p1,p2))
fun RETURN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(ParserData.MlyValue.VOID',p1,p2))
fun BREAK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(ParserData.MlyValue.VOID',p1,p2))
fun CONTINUE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(ParserData.MlyValue.VOID',p1,p2))
fun EQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(ParserData.MlyValue.VOID',p1,p2))
fun PLUSEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(ParserData.MlyValue.VOID',p1,p2))
fun MINUSEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(ParserData.MlyValue.VOID',p1,p2))
fun MULTEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(ParserData.MlyValue.VOID',p1,p2))
fun DIVEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(ParserData.MlyValue.VOID',p1,p2))
fun INC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(ParserData.MlyValue.VOID',p1,p2))
fun DEC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(ParserData.MlyValue.VOID',p1,p2))
fun OR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(ParserData.MlyValue.VOID',p1,p2))
fun AND (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(ParserData.MlyValue.VOID',p1,p2))
fun NOT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(ParserData.MlyValue.VOID',p1,p2))
fun LESSEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(ParserData.MlyValue.VOID',p1,p2))
fun LESS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(ParserData.MlyValue.VOID',p1,p2))
fun GREATER (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(ParserData.MlyValue.VOID',p1,p2))
fun GREATEREQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(ParserData.MlyValue.VOID',p1,p2))
fun EQUALEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(ParserData.MlyValue.VOID',p1,p2))
fun NOTEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(ParserData.MlyValue.VOID',p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(ParserData.MlyValue.VOID',p1,p2))
fun MINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(ParserData.MlyValue.VOID',p1,p2))
fun MULT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(ParserData.MlyValue.VOID',p1,p2))
fun DIV (p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(ParserData.MlyValue.VOID',p1,p2))
fun MOD (p1,p2) = Token.TOKEN (ParserData.LrTable.T 44,(ParserData.MlyValue.VOID',p1,p2))
fun QUES (p1,p2) = Token.TOKEN (ParserData.LrTable.T 45,(ParserData.MlyValue.VOID',p1,p2))
fun DASH (p1,p2) = Token.TOKEN (ParserData.LrTable.T 46,(ParserData.MlyValue.VOID',p1,p2))
fun STAR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 47,(ParserData.MlyValue.VOID',p1,p2))
fun NUMCONST (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 48,(ParserData.MlyValue.NUMCONST i,p1,p2))
fun CHARCONST (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 49,(ParserData.MlyValue.CHARCONST i,p1,p2))
fun TRUE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 50,(ParserData.MlyValue.VOID',p1,p2))
fun FALSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 51,(ParserData.MlyValue.VOID',p1,p2))
fun iff (p1,p2) = Token.TOKEN (ParserData.LrTable.T 52,(ParserData.MlyValue.VOID',p1,p2))
fun c (p1,p2) = Token.TOKEN (ParserData.LrTable.T 53,(ParserData.MlyValue.VOID',p1,p2))
end
end

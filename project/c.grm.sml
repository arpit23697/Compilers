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
\\001\000\002\000\003\000\000\000\
\\001\000\003\000\004\000\000\000\
\\001\000\004\000\000\000\000\000\
\\001\000\005\000\017\000\000\000\
\\001\000\005\000\019\000\000\000\
\\001\000\005\000\045\000\006\000\107\000\007\000\142\000\009\000\141\000\
\\014\000\044\000\020\000\140\000\022\000\139\000\024\000\138\000\
\\025\000\137\000\026\000\136\000\036\000\043\000\044\000\042\000\
\\051\000\041\000\052\000\040\000\053\000\039\000\054\000\038\000\
\\058\000\135\000\000\000\
\\001\000\005\000\045\000\006\000\107\000\009\000\141\000\014\000\044\000\
\\020\000\140\000\022\000\139\000\024\000\138\000\025\000\137\000\
\\026\000\136\000\036\000\043\000\044\000\042\000\051\000\041\000\
\\052\000\040\000\053\000\039\000\054\000\038\000\058\000\135\000\000\000\
\\001\000\005\000\045\000\009\000\149\000\014\000\044\000\036\000\043\000\
\\044\000\042\000\051\000\041\000\052\000\040\000\053\000\039\000\
\\054\000\038\000\000\000\
\\001\000\005\000\045\000\014\000\044\000\036\000\043\000\044\000\042\000\
\\051\000\041\000\052\000\040\000\053\000\039\000\054\000\038\000\000\000\
\\001\000\005\000\045\000\014\000\044\000\044\000\042\000\051\000\041\000\
\\052\000\040\000\053\000\039\000\054\000\038\000\000\000\
\\001\000\005\000\047\000\000\000\
\\001\000\005\000\077\000\000\000\
\\001\000\006\000\107\000\000\000\
\\001\000\008\000\022\000\009\000\021\000\000\000\
\\001\000\009\000\143\000\000\000\
\\001\000\009\000\144\000\000\000\
\\001\000\009\000\146\000\000\000\
\\001\000\009\000\147\000\000\000\
\\001\000\009\000\153\000\000\000\
\\001\000\012\000\078\000\000\000\
\\001\000\012\000\110\000\000\000\
\\001\000\012\000\119\000\000\000\
\\001\000\014\000\025\000\000\000\
\\001\000\014\000\150\000\000\000\
\\001\000\014\000\151\000\000\000\
\\001\000\015\000\075\000\000\000\
\\001\000\015\000\079\000\000\000\
\\001\000\015\000\101\000\000\000\
\\001\000\015\000\116\000\000\000\
\\001\000\015\000\158\000\034\000\067\000\000\000\
\\001\000\015\000\159\000\034\000\067\000\000\000\
\\001\000\016\000\013\000\017\000\012\000\018\000\011\000\000\000\
\\001\000\016\000\013\000\017\000\012\000\018\000\011\000\019\000\010\000\000\000\
\\001\000\051\000\052\000\000\000\
\\001\000\059\000\145\000\000\000\
\\167\000\016\000\013\000\017\000\012\000\018\000\011\000\019\000\010\000\000\000\
\\168\000\000\000\
\\169\000\000\000\
\\170\000\000\000\
\\171\000\000\000\
\\172\000\000\000\
\\173\000\000\000\
\\174\000\000\000\
\\175\000\027\000\020\000\000\000\
\\176\000\034\000\067\000\000\000\
\\177\000\011\000\024\000\000\000\
\\177\000\011\000\024\000\014\000\023\000\000\000\
\\178\000\000\000\
\\179\000\000\000\
\\180\000\000\000\
\\181\000\000\000\
\\182\000\000\000\
\\183\000\000\000\
\\184\000\016\000\013\000\017\000\012\000\018\000\011\000\000\000\
\\185\000\008\000\074\000\000\000\
\\186\000\000\000\
\\187\000\000\000\
\\188\000\000\000\
\\189\000\011\000\108\000\000\000\
\\190\000\000\000\
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
\\202\000\016\000\013\000\017\000\012\000\018\000\011\000\000\000\
\\203\000\000\000\
\\204\000\000\000\
\\205\000\000\000\
\\206\000\021\000\164\000\000\000\
\\207\000\000\000\
\\208\000\000\000\
\\209\000\000\000\
\\210\000\000\000\
\\211\000\000\000\
\\212\000\000\000\
\\213\000\000\000\
\\214\000\034\000\067\000\059\000\157\000\000\000\
\\215\000\000\000\
\\216\000\000\000\
\\217\000\000\000\
\\218\000\000\000\
\\219\000\000\000\
\\220\000\000\000\
\\221\000\000\000\
\\222\000\000\000\
\\223\000\000\000\
\\224\000\034\000\067\000\000\000\
\\225\000\035\000\066\000\000\000\
\\226\000\035\000\066\000\000\000\
\\227\000\000\000\
\\228\000\000\000\
\\229\000\000\000\
\\230\000\000\000\
\\231\000\043\000\059\000\044\000\058\000\000\000\
\\232\000\043\000\059\000\044\000\058\000\000\000\
\\233\000\043\000\059\000\044\000\058\000\000\000\
\\234\000\043\000\059\000\044\000\058\000\000\000\
\\235\000\043\000\059\000\044\000\058\000\000\000\
\\236\000\043\000\059\000\044\000\058\000\000\000\
\\237\000\037\000\065\000\038\000\064\000\039\000\063\000\040\000\062\000\
\\041\000\061\000\042\000\060\000\043\000\059\000\044\000\058\000\000\000\
\\238\000\045\000\057\000\046\000\056\000\047\000\055\000\000\000\
\\239\000\045\000\057\000\046\000\056\000\047\000\055\000\000\000\
\\240\000\045\000\057\000\046\000\056\000\047\000\055\000\000\000\
\\241\000\000\000\
\\242\000\000\000\
\\243\000\000\000\
\\244\000\000\000\
\\245\000\000\000\
\\246\000\000\000\
\\247\000\000\000\
\\248\000\011\000\054\000\000\000\
\\248\000\011\000\054\000\027\000\100\000\028\000\099\000\029\000\098\000\
\\030\000\097\000\031\000\096\000\032\000\095\000\033\000\094\000\000\000\
\\249\000\014\000\073\000\000\000\
\\250\000\000\000\
\\251\000\000\000\
\\252\000\000\000\
\\253\000\000\000\
\\254\000\000\000\
\\255\000\005\000\045\000\014\000\044\000\036\000\043\000\044\000\042\000\
\\051\000\041\000\052\000\040\000\053\000\039\000\054\000\038\000\000\000\
\\000\001\008\000\117\000\000\000\
\\001\001\000\000\
\\002\001\000\000\
\\003\001\000\000\
\\004\001\000\000\
\\005\001\000\000\
\\006\001\000\000\
\"
val actionRowNumbers =
"\000\000\001\000\032\000\039\000\
\\003\000\038\000\037\000\035\000\
\\004\000\050\000\049\000\048\000\
\\043\000\041\000\013\000\046\000\
\\036\000\022\000\008\000\040\000\
\\010\000\053\000\033\000\053\000\
\\123\000\122\000\116\000\117\000\
\\115\000\113\000\109\000\106\000\
\\099\000\097\000\095\000\044\000\
\\132\000\131\000\130\000\129\000\
\\009\000\008\000\008\000\119\000\
\\042\000\045\000\055\000\054\000\
\\025\000\011\000\019\000\026\000\
\\008\000\009\000\009\000\009\000\
\\009\000\009\000\009\000\009\000\
\\009\000\009\000\009\000\009\000\
\\008\000\008\000\114\000\098\000\
\\118\000\093\000\027\000\125\000\
\\031\000\012\000\057\000\058\000\
\\047\000\012\000\020\000\112\000\
\\111\000\110\000\108\000\107\000\
\\105\000\104\000\103\000\102\000\
\\101\000\100\000\096\000\094\000\
\\092\000\091\000\008\000\008\000\
\\008\000\008\000\008\000\121\000\
\\028\000\126\000\128\000\056\000\
\\051\000\070\000\021\000\052\000\
\\120\000\090\000\089\000\088\000\
\\087\000\086\000\124\000\008\000\
\\071\000\059\000\127\000\005\000\
\\010\000\069\000\014\000\067\000\
\\015\000\066\000\065\000\064\000\
\\063\000\062\000\060\000\061\000\
\\072\000\034\000\016\000\017\000\
\\007\000\023\000\024\000\074\000\
\\068\000\085\000\073\000\008\000\
\\081\000\080\000\018\000\078\000\
\\008\000\008\000\083\000\079\000\
\\029\000\030\000\082\000\008\000\
\\006\000\006\000\083\000\077\000\
\\075\000\084\000\006\000\076\000\
\\002\000"
val gotoT =
"\
\\001\000\164\000\000\000\
\\000\000\
\\002\000\007\000\003\000\006\000\004\000\005\000\008\000\004\000\
\\009\000\003\000\000\000\
\\000\000\
\\005\000\014\000\006\000\013\000\007\000\012\000\000\000\
\\000\000\
\\000\000\
\\003\000\016\000\004\000\005\000\008\000\004\000\009\000\003\000\000\000\
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
\\025\000\035\000\026\000\034\000\027\000\033\000\028\000\032\000\
\\029\000\031\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\000\000\
\\006\000\044\000\007\000\012\000\000\000\
\\008\000\049\000\010\000\048\000\011\000\047\000\012\000\046\000\000\000\
\\000\000\
\\008\000\049\000\010\000\051\000\011\000\047\000\012\000\046\000\000\000\
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
\\031\000\066\000\032\000\028\000\033\000\027\000\034\000\026\000\
\\035\000\025\000\038\000\024\000\000\000\
\\027\000\067\000\028\000\032\000\029\000\031\000\030\000\030\000\
\\031\000\029\000\032\000\028\000\033\000\027\000\034\000\026\000\
\\035\000\025\000\038\000\024\000\000\000\
\\024\000\070\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\013\000\074\000\000\000\
\\000\000\
\\000\000\
\\024\000\078\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\000\000\
\\031\000\079\000\032\000\028\000\033\000\027\000\034\000\026\000\
\\035\000\025\000\038\000\024\000\000\000\
\\031\000\080\000\032\000\028\000\033\000\027\000\034\000\026\000\
\\035\000\025\000\038\000\024\000\000\000\
\\031\000\081\000\032\000\028\000\033\000\027\000\034\000\026\000\
\\035\000\025\000\038\000\024\000\000\000\
\\030\000\082\000\031\000\029\000\032\000\028\000\033\000\027\000\
\\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\030\000\083\000\031\000\029\000\032\000\028\000\033\000\027\000\
\\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\029\000\084\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\029\000\085\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\029\000\086\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\029\000\087\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\029\000\088\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\029\000\089\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\027\000\090\000\028\000\032\000\029\000\031\000\030\000\030\000\
\\031\000\029\000\032\000\028\000\033\000\027\000\034\000\026\000\
\\035\000\025\000\038\000\024\000\000\000\
\\026\000\091\000\027\000\033\000\028\000\032\000\029\000\031\000\
\\030\000\030\000\031\000\029\000\032\000\028\000\033\000\027\000\
\\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\024\000\102\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\036\000\101\000\037\000\100\000\038\000\024\000\000\000\
\\008\000\049\000\012\000\103\000\000\000\
\\015\000\104\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\015\000\107\000\000\000\
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
\\024\000\109\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\000\000\
\\024\000\110\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\000\000\
\\024\000\111\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\000\000\
\\024\000\112\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\000\000\
\\024\000\113\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\016\000\116\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\024\000\118\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\000\000\
\\004\000\121\000\008\000\120\000\017\000\119\000\000\000\
\\000\000\
\\000\000\
\\014\000\132\000\015\000\131\000\018\000\130\000\019\000\129\000\
\\020\000\128\000\021\000\127\000\022\000\126\000\023\000\125\000\
\\024\000\124\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\039\000\123\000\041\000\122\000\000\000\
\\005\000\014\000\006\000\013\000\007\000\012\000\000\000\
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
\\024\000\146\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\025\000\150\000\026\000\034\000\027\000\033\000\028\000\032\000\
\\029\000\031\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\025\000\152\000\026\000\034\000\027\000\033\000\028\000\032\000\
\\029\000\031\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\025\000\153\000\026\000\034\000\027\000\033\000\028\000\032\000\
\\029\000\031\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\040\000\154\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\025\000\158\000\026\000\034\000\027\000\033\000\028\000\032\000\
\\029\000\031\000\030\000\030\000\031\000\029\000\032\000\028\000\
\\033\000\027\000\034\000\026\000\035\000\025\000\038\000\024\000\000\000\
\\014\000\159\000\015\000\131\000\018\000\130\000\019\000\129\000\
\\020\000\128\000\021\000\127\000\022\000\126\000\023\000\125\000\
\\024\000\124\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\039\000\123\000\041\000\122\000\000\000\
\\014\000\160\000\015\000\131\000\018\000\130\000\019\000\129\000\
\\020\000\128\000\021\000\127\000\022\000\126\000\023\000\125\000\
\\024\000\124\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\039\000\123\000\041\000\122\000\000\000\
\\040\000\161\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\014\000\163\000\015\000\131\000\018\000\130\000\019\000\129\000\
\\020\000\128\000\021\000\127\000\022\000\126\000\023\000\125\000\
\\024\000\124\000\025\000\069\000\026\000\034\000\027\000\033\000\
\\028\000\032\000\029\000\031\000\030\000\030\000\031\000\029\000\
\\032\000\028\000\033\000\068\000\034\000\026\000\035\000\025\000\
\\038\000\024\000\039\000\123\000\041\000\122\000\000\000\
\\000\000\
\\000\000\
\"
val numstates = 165
val numrules = 96
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
datatype svalue = VOID' | ntVOID of unit | CHARCONST of  (string) | NUMCONST of  (string) | ID of  (string) | HEADERn of  (string) | HEADER of  (string) | singlePrintStmt of  (Ast.simpleExpression list) | printStmtHelp of  (Ast.simpleExpression list) | printStmt of  (Ast.printStmt) | constant of  (Ast.constant) | args of  (Ast.expression list) | argList of  (Ast.expression list) | call of  (Ast.call) | immutable of  (Ast.immutable) | mutable of  (Ast.mutable) | factor of  (Ast.factor) | unaryExpression of  (Ast.unaryExpression) | term of  (Ast.term) | sumExpression of  (Ast.sumExpression) | relExpression of  (Ast.relExpression) | unaryRelExpression of  (Ast.unaryRelExpression) | andExpression of  (Ast.andExpression) | simpleExpression of  (Ast.simpleExpression) | expression of  (Ast.expression) | continueStmt of  (Ast.continueStmt) | breakStmt of  (Ast.breakStmt) | returnStmt of  (Ast.returnStmt) | iterationStmt of  (Ast.iterationStmt) | selectionStmt of  (Ast.selectionStmt) | expressionStmt of  (Ast.expressionStmt) | statementList of  (Ast.statement list) | localDeclarations of  (Ast.localDeclarations) | compoundStmt of  (Ast.compoundStmt) | statement of  (Ast.statement) | paramID of  (Ast.paramID) | paramType of  (Ast.paramType) | paramList of  (Ast.paramType list) | params of  (Ast.paramType list) | funDeclaration of  (Ast.funDeclaration) | typeSpecifier of  (Ast.typeSpecifier) | varDeclID of  (Ast.varDeclID) | varDeclInitialize of  (Ast.varDeclInitialize) | varDeclList of  (Ast.varDeclInitialize list) | varDeclaration of  (Ast.varDeclaration) | declaration of  (Ast.declaration) | declarationList of  (Ast.declaration list) | program of  (Ast.program)
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
fn (T 3) => true | _ => false
val showTerminal =
fn (T 0) => "RECORD"
  | (T 1) => "HEADER"
  | (T 2) => "HEADERn"
  | (T 3) => "EOF"
  | (T 4) => "ID"
  | (T 5) => "LEFTBRACE"
  | (T 6) => "RIGHTBRACE"
  | (T 7) => "COMMA"
  | (T 8) => "SEMICOLON"
  | (T 9) => "COLON"
  | (T 10) => "LEFTBRACKET"
  | (T 11) => "RIGHTBRACKET"
  | (T 12) => "STATIC"
  | (T 13) => "LPARA"
  | (T 14) => "RPARA"
  | (T 15) => "INT"
  | (T 16) => "BOOL"
  | (T 17) => "CHAR"
  | (T 18) => "VOID"
  | (T 19) => "IF"
  | (T 20) => "ELSE"
  | (T 21) => "WHILE"
  | (T 22) => "FOR"
  | (T 23) => "RETURN"
  | (T 24) => "BREAK"
  | (T 25) => "CONTINUE"
  | (T 26) => "EQUAL"
  | (T 27) => "PLUSEQUAL"
  | (T 28) => "MINUSEQUAL"
  | (T 29) => "MULTEQUAL"
  | (T 30) => "DIVEQUAL"
  | (T 31) => "INC"
  | (T 32) => "DEC"
  | (T 33) => "OR"
  | (T 34) => "AND"
  | (T 35) => "NOT"
  | (T 36) => "LESSEQUAL"
  | (T 37) => "LESS"
  | (T 38) => "GREATER"
  | (T 39) => "GREATEREQUAL"
  | (T 40) => "EQUALEQUAL"
  | (T 41) => "NOTEQUAL"
  | (T 42) => "PLUS"
  | (T 43) => "MINUS"
  | (T 44) => "MULT"
  | (T 45) => "DIV"
  | (T 46) => "MOD"
  | (T 47) => "QUES"
  | (T 48) => "DASH"
  | (T 49) => "STAR"
  | (T 50) => "NUMCONST"
  | (T 51) => "CHARCONST"
  | (T 52) => "TRUE"
  | (T 53) => "FALSE"
  | (T 54) => "iff"
  | (T 55) => "c"
  | (T 56) => "COLONEQUAL"
  | (T 57) => "COUT"
  | (T 58) => "LLBRACKET"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID'
end
val terms : term list = nil
 $$ (T 58) $$ (T 57) $$ (T 56) $$ (T 55) $$ (T 54) $$ (T 53) $$ (T 52) $$ (T 49) $$ (T 48) $$ (T 47) $$ (T 46) $$ (T 45) $$ (T 44) $$ (T 43) $$ (T 42) $$ (T 41) $$ (T 40) $$ (T 39) $$ (T 38) $$ (T 37) $$ (T 36) $$ (T 35) $$ (T 34) $$ (T 33) $$ (T 32) $$ (T 31) $$ (T 30) $$ (T 29) $$ (T 28) $$ (T 27) $$ (T 26) $$ (T 25) $$ (T 24) $$ (T 23) $$ (T 22) $$ (T 21) $$ (T 20) $$ (T 19) $$ (T 18) $$ (T 17) $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11) $$ (T 10) $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 3) $$ (T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.declarationList declarationList, _, declarationList1right)) :: ( _, ( MlyValue.HEADERn HEADERn, _, _)) :: ( _, ( MlyValue.HEADER HEADER, HEADER1left, _)) :: rest671)) => let val  result = MlyValue.program ((*#line 140.81 "c.grm"*) Ast.declL(HEADER, HEADERn , declarationList) (*#line 611.1 "c.grm.sml"*)
)
 in ( LrTable.NT 0, ( result, HEADER1left, declarationList1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.declaration declaration, _, declaration1right)) :: ( _, ( MlyValue.declarationList declarationList, declarationList1left, _)) :: rest671)) => let val  result = MlyValue.declarationList ((*#line 142.66 "c.grm"*) declarationList @ [declaration] (*#line 615.1 "c.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, declarationList1left, declaration1right), rest671)
end
|  ( 2, ( ( _, ( MlyValue.declaration declaration, declaration1left, declaration1right)) :: rest671)) => let val  result = MlyValue.declarationList ((*#line 143.66 "c.grm"*) [declaration] (*#line 619.1 "c.grm.sml"*)
)
 in ( LrTable.NT 1, ( result, declaration1left, declaration1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.varDeclaration varDeclaration, varDeclaration1left, varDeclaration1right)) :: rest671)) => let val  result = MlyValue.declaration ((*#line 145.66 "c.grm"*)Ast.variableDeclaration (varDeclaration) (*#line 623.1 "c.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, varDeclaration1left, varDeclaration1right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.funDeclaration funDeclaration, funDeclaration1left, funDeclaration1right)) :: rest671)) => let val  result = MlyValue.declaration ((*#line 146.66 "c.grm"*)Ast.functionDeclaration (funDeclaration) (*#line 627.1 "c.grm.sml"*)
)
 in ( LrTable.NT 2, ( result, funDeclaration1left, funDeclaration1right), rest671)
end
|  ( 5, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( MlyValue.varDeclList varDeclList, _, _)) :: ( _, ( MlyValue.typeSpecifier typeSpecifier, typeSpecifier1left, _)) :: rest671)) => let val  result = MlyValue.varDeclaration ((*#line 149.79 "c.grm"*)Ast.vDecl (typeSpecifier , varDeclList)(*#line 631.1 "c.grm.sml"*)
)
 in ( LrTable.NT 3, ( result, typeSpecifier1left, SEMICOLON1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.varDeclInitialize varDeclInitialize, varDeclInitialize1left, varDeclInitialize1right)) :: rest671)) => let val  result = MlyValue.varDeclList ((*#line 151.73 "c.grm"*)[varDeclInitialize](*#line 635.1 "c.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, varDeclInitialize1left, varDeclInitialize1right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.varDeclInitialize varDeclInitialize, _, varDeclInitialize1right)) :: _ :: ( _, ( MlyValue.varDeclList varDeclList, varDeclList1left, _)) :: rest671)) => let val  result = MlyValue.varDeclList ((*#line 152.74 "c.grm"*) varDeclList @ [varDeclInitialize] (*#line 639.1 "c.grm.sml"*)
)
 in ( LrTable.NT 4, ( result, varDeclList1left, varDeclInitialize1right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.varDeclID varDeclID, varDeclID1left, varDeclID1right)) :: rest671)) => let val  result = MlyValue.varDeclInitialize ((*#line 155.70 "c.grm"*)Ast.declarationOnlyID (varDeclID) (*#line 643.1 "c.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, varDeclID1left, varDeclID1right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.simpleExpression simpleExpression, _, simpleExpression1right)) :: _ :: ( _, ( MlyValue.varDeclID varDeclID, varDeclID1left, _)) :: rest671)) => let val  result = MlyValue.varDeclInitialize ((*#line 156.70 "c.grm"*)Ast.declarationAssignment (varDeclID , simpleExpression)(*#line 647.1 "c.grm.sml"*)
)
 in ( LrTable.NT 5, ( result, varDeclID1left, simpleExpression1right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.varDeclID ((*#line 158.69 "c.grm"*)Ast.vID (ID)(*#line 651.1 "c.grm.sml"*)
)
 in ( LrTable.NT 6, ( result, ID1left, ID1right), rest671)
end
|  ( 11, ( ( _, ( _, _, RIGHTBRACKET1right)) :: ( _, ( MlyValue.NUMCONST NUMCONST, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.varDeclID ((*#line 159.70 "c.grm"*)Ast.arrayLike (ID , NUMCONST)(*#line 655.1 "c.grm.sml"*)
)
 in ( LrTable.NT 6, ( result, ID1left, RIGHTBRACKET1right), rest671)
end
|  ( 12, ( ( _, ( _, INT1left, INT1right)) :: rest671)) => let val  result = MlyValue.typeSpecifier ((*#line 161.64 "c.grm"*)Ast.integer(*#line 659.1 "c.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, INT1left, INT1right), rest671)
end
|  ( 13, ( ( _, ( _, BOOL1left, BOOL1right)) :: rest671)) => let val  result = MlyValue.typeSpecifier ((*#line 162.70 "c.grm"*)Ast.boolean(*#line 663.1 "c.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, BOOL1left, BOOL1right), rest671)
end
|  ( 14, ( ( _, ( _, CHAR1left, CHAR1right)) :: rest671)) => let val  result = MlyValue.typeSpecifier ((*#line 163.70 "c.grm"*)Ast.character(*#line 667.1 "c.grm.sml"*)
)
 in ( LrTable.NT 7, ( result, CHAR1left, CHAR1right), rest671)
end
|  ( 15, ( ( _, ( MlyValue.compoundStmt compoundStmt, _, compoundStmt1right)) :: _ :: ( _, ( MlyValue.params params, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( MlyValue.typeSpecifier typeSpecifier, typeSpecifier1left, _)) :: rest671)) => let val  result = MlyValue.funDeclaration ((*#line 167.74 "c.grm"*)Ast.functionReturn (typeSpecifier , ID , params , compoundStmt)(*#line 671.1 "c.grm.sml"*)
)
 in ( LrTable.NT 8, ( result, typeSpecifier1left, compoundStmt1right), rest671)
end
|  ( 16, ( ( _, ( MlyValue.compoundStmt compoundStmt, _, compoundStmt1right)) :: _ :: ( _, ( MlyValue.params params, _, _)) :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: ( _, ( _, VOID1left, _)) :: rest671)) => let val  result = MlyValue.funDeclaration ((*#line 168.73 "c.grm"*)Ast.functionVoid (ID , params , compoundStmt)(*#line 675.1 "c.grm.sml"*)
)
 in ( LrTable.NT 8, ( result, VOID1left, compoundStmt1right), rest671)
end
|  ( 17, ( rest671)) => let val  result = MlyValue.params ((*#line 170.67 "c.grm"*)[](*#line 679.1 "c.grm.sml"*)
)
 in ( LrTable.NT 9, ( result, defaultPos, defaultPos), rest671)
end
|  ( 18, ( ( _, ( MlyValue.paramList paramList, paramList1left, paramList1right)) :: rest671)) => let val  result = MlyValue.params ((*#line 171.67 "c.grm"*)paramList(*#line 683.1 "c.grm.sml"*)
)
 in ( LrTable.NT 9, ( result, paramList1left, paramList1right), rest671)
end
|  ( 19, ( ( _, ( MlyValue.paramType paramType, paramType1left, paramType1right)) :: rest671)) => let val  result = MlyValue.paramList ((*#line 173.69 "c.grm"*)[paramType](*#line 687.1 "c.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, paramType1left, paramType1right), rest671)
end
|  ( 20, ( ( _, ( MlyValue.paramType paramType, _, paramType1right)) :: _ :: ( _, ( MlyValue.paramList paramList, paramList1left, _)) :: rest671)) => let val  result = MlyValue.paramList ((*#line 174.62 "c.grm"*) paramList @ [paramType] (*#line 691.1 "c.grm.sml"*)
)
 in ( LrTable.NT 10, ( result, paramList1left, paramType1right), rest671)
end
|  ( 21, ( ( _, ( MlyValue.paramID paramID, _, paramID1right)) :: ( _, ( MlyValue.typeSpecifier typeSpecifier, typeSpecifier1left, _)) :: rest671)) => let val  result = MlyValue.paramType ((*#line 176.62 "c.grm"*)Ast.parameter(typeSpecifier , paramID)(*#line 695.1 "c.grm.sml"*)
)
 in ( LrTable.NT 11, ( result, typeSpecifier1left, paramID1right), rest671)
end
|  ( 22, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.paramID ((*#line 178.70 "c.grm"*)Ast.normalID (ID)(*#line 699.1 "c.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, ID1left, ID1right), rest671)
end
|  ( 23, ( ( _, ( _, _, RIGHTBRACKET1right)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.paramID ((*#line 179.70 "c.grm"*)Ast.arrayID (ID)(*#line 703.1 "c.grm.sml"*)
)
 in ( LrTable.NT 12, ( result, ID1left, RIGHTBRACKET1right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.expressionStmt expressionStmt, expressionStmt1left, expressionStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 182.70 "c.grm"*)Ast.eStatement (expressionStmt)(*#line 707.1 "c.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, expressionStmt1left, expressionStmt1right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.compoundStmt compoundStmt, compoundStmt1left, compoundStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 183.70 "c.grm"*)Ast.cStatement (compoundStmt)(*#line 711.1 "c.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, compoundStmt1left, compoundStmt1right), rest671)
end
|  ( 26, ( ( _, ( MlyValue.selectionStmt selectionStmt, selectionStmt1left, selectionStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 184.70 "c.grm"*)Ast.sStatement (selectionStmt)(*#line 715.1 "c.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, selectionStmt1left, selectionStmt1right), rest671)
end
|  ( 27, ( ( _, ( MlyValue.iterationStmt iterationStmt, iterationStmt1left, iterationStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 185.70 "c.grm"*)Ast.iStatement (iterationStmt)(*#line 719.1 "c.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, iterationStmt1left, iterationStmt1right), rest671)
end
|  ( 28, ( ( _, ( MlyValue.returnStmt returnStmt, returnStmt1left, returnStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 186.70 "c.grm"*)Ast.rStatement (returnStmt)(*#line 723.1 "c.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, returnStmt1left, returnStmt1right), rest671)
end
|  ( 29, ( ( _, ( MlyValue.breakStmt breakStmt, breakStmt1left, breakStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 187.70 "c.grm"*)Ast.bStatement (breakStmt)(*#line 727.1 "c.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, breakStmt1left, breakStmt1right), rest671)
end
|  ( 30, ( ( _, ( MlyValue.continueStmt continueStmt, continueStmt1left, continueStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 188.71 "c.grm"*)Ast.conStatement (continueStmt)(*#line 731.1 "c.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, continueStmt1left, continueStmt1right), rest671)
end
|  ( 31, ( ( _, ( MlyValue.printStmt printStmt, printStmt1left, printStmt1right)) :: rest671)) => let val  result = MlyValue.statement ((*#line 189.72 "c.grm"*)Ast.printStatement (printStmt) (*#line 735.1 "c.grm.sml"*)
)
 in ( LrTable.NT 13, ( result, printStmt1left, printStmt1right), rest671)
end
|  ( 32, ( ( _, ( _, _, RIGHTBRACE1right)) :: ( _, ( MlyValue.statementList statementList, _, _)) :: ( _, ( MlyValue.localDeclarations localDeclarations, _, _)) :: ( _, ( _, LEFTBRACE1left, _)) :: rest671)) => let val  result = MlyValue.compoundStmt ((*#line 190.72 "c.grm"*)Ast.statementWithBrace (localDeclarations , statementList)(*#line 739.1 "c.grm.sml"*)
)
 in ( LrTable.NT 14, ( result, LEFTBRACE1left, RIGHTBRACE1right), rest671)
end
|  ( 33, ( ( _, ( MlyValue.varDeclaration varDeclaration, _, varDeclaration1right)) :: ( _, ( MlyValue.localDeclarations localDeclarations, localDeclarations1left, _)) :: rest671)) => let val  result = MlyValue.localDeclarations ((*#line 192.64 "c.grm"*)Ast.declIn (localDeclarations , varDeclaration) (*#line 743.1 "c.grm.sml"*)
)
 in ( LrTable.NT 15, ( result, localDeclarations1left, varDeclaration1right), rest671)
end
|  ( 34, ( rest671)) => let val  result = MlyValue.localDeclarations ((*#line 193.70 "c.grm"*)Ast.emptyDeclIn(*#line 747.1 "c.grm.sml"*)
)
 in ( LrTable.NT 15, ( result, defaultPos, defaultPos), rest671)
end
|  ( 35, ( rest671)) => let val  result = MlyValue.statementList ((*#line 195.72 "c.grm"*)[] (*#line 751.1 "c.grm.sml"*)
)
 in ( LrTable.NT 16, ( result, defaultPos, defaultPos), rest671)
end
|  ( 36, ( ( _, ( MlyValue.statement statement, _, statement1right)) :: ( _, ( MlyValue.statementList statementList, statementList1left, _)) :: rest671)) => let val  result = MlyValue.statementList ((*#line 196.64 "c.grm"*)statementList @ [statement](*#line 755.1 "c.grm.sml"*)
)
 in ( LrTable.NT 16, ( result, statementList1left, statement1right), rest671)
end
|  ( 37, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( MlyValue.expression expression, expression1left, _)) :: rest671)) => let val  result = MlyValue.expressionStmt ((*#line 199.70 "c.grm"*)Ast.basicExpression (expression)(*#line 759.1 "c.grm.sml"*)
)
 in ( LrTable.NT 17, ( result, expression1left, SEMICOLON1right), rest671)
end
|  ( 38, ( ( _, ( _, SEMICOLON1left, SEMICOLON1right)) :: rest671)) => let val  result = MlyValue.expressionStmt ((*#line 200.70 "c.grm"*)Ast.semicolon (*#line 763.1 "c.grm.sml"*)
)
 in ( LrTable.NT 17, ( result, SEMICOLON1left, SEMICOLON1right), rest671)
end
|  ( 39, ( ( _, ( MlyValue.statement statement, _, statement1right)) :: _ :: ( _, ( MlyValue.simpleExpression simpleExpression, _, _)) :: _ :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.selectionStmt ((*#line 202.78 "c.grm"*)Ast.IF (simpleExpression , statement)(*#line 767.1 "c.grm.sml"*)
)
 in ( LrTable.NT 18, ( result, IF1left, statement1right), rest671)
end
|  ( 40, ( ( _, ( MlyValue.statement statement2, _, statement2right)) :: _ :: ( _, ( MlyValue.statement statement1, _, _)) :: _ :: ( _, ( MlyValue.simpleExpression simpleExpression, _, _)) :: _ :: ( _, ( _, IF1left, _)) :: rest671)) => let val  result = MlyValue.selectionStmt ((*#line 203.74 "c.grm"*)Ast.IF_ELSE (simpleExpression , statement1 , statement2)(*#line 771.1 "c.grm.sml"*)
)
 in ( LrTable.NT 18, ( result, IF1left, statement2right), rest671)
end
|  ( 41, ( ( _, ( MlyValue.statement statement, _, statement1right)) :: _ :: ( _, ( MlyValue.simpleExpression simpleExpression, _, _)) :: _ :: ( _, ( _, WHILE1left, _)) :: rest671)) => let val  result = MlyValue.iterationStmt ((*#line 205.71 "c.grm"*)Ast.WHILE(simpleExpression , statement)(*#line 775.1 "c.grm.sml"*)
)
 in ( LrTable.NT 19, ( result, WHILE1left, statement1right), rest671)
end
|  ( 42, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( _, RETURN1left, _)) :: rest671)) => let val  result = MlyValue.returnStmt ((*#line 207.71 "c.grm"*)Ast.returnNoValue(*#line 779.1 "c.grm.sml"*)
)
 in ( LrTable.NT 20, ( result, RETURN1left, SEMICOLON1right), rest671)
end
|  ( 43, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( MlyValue.expression expression, _, _)) :: ( _, ( _, RETURN1left, _)) :: rest671)) => let val  result = MlyValue.returnStmt ((*#line 208.70 "c.grm"*)Ast.returnValue (expression)(*#line 783.1 "c.grm.sml"*)
)
 in ( LrTable.NT 20, ( result, RETURN1left, SEMICOLON1right), rest671)
end
|  ( 44, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( _, BREAK1left, _)) :: rest671)) => let val  result = MlyValue.breakStmt ((*#line 210.74 "c.grm"*)Ast.BREAK(*#line 787.1 "c.grm.sml"*)
)
 in ( LrTable.NT 21, ( result, BREAK1left, SEMICOLON1right), rest671)
end
|  ( 45, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( _, CONTINUE1left, _)) :: rest671)) => let val  result = MlyValue.continueStmt ((*#line 211.74 "c.grm"*)Ast.CONTINUE(*#line 791.1 "c.grm.sml"*)
)
 in ( LrTable.NT 22, ( result, CONTINUE1left, SEMICOLON1right), rest671)
end
|  ( 46, ( ( _, ( MlyValue.printStmtHelp printStmtHelp, _, printStmtHelp1right)) :: ( _, ( MlyValue.simpleExpression simpleExpression, _, _)) :: _ :: ( _, ( _, COUT1left, _)) :: rest671)) => let val  result = MlyValue.singlePrintStmt ((*#line 213.83 "c.grm"*) simpleExpression :: printStmtHelp  (*#line 795.1 "c.grm.sml"*)
)
 in ( LrTable.NT 40, ( result, COUT1left, printStmtHelp1right), rest671)
end
|  ( 47, ( rest671)) => let val  result = MlyValue.printStmtHelp ((*#line 214.59 "c.grm"*) [] (*#line 799.1 "c.grm.sml"*)
)
 in ( LrTable.NT 39, ( result, defaultPos, defaultPos), rest671)
end
|  ( 48, ( ( _, ( MlyValue.printStmtHelp printStmtHelp, _, printStmtHelp1right)) :: ( _, ( MlyValue.simpleExpression simpleExpression, _, _)) :: ( _, ( _, LLBRACKET1left, _)) :: rest671)) => let val  result = MlyValue.printStmtHelp ((*#line 215.73 "c.grm"*) simpleExpression :: printStmtHelp  (*#line 803.1 "c.grm.sml"*)
)
 in ( LrTable.NT 39, ( result, LLBRACKET1left, printStmtHelp1right), rest671)
end
|  ( 49, ( ( _, ( _, _, SEMICOLON1right)) :: ( _, ( MlyValue.singlePrintStmt singlePrintStmt, singlePrintStmt1left, _)) :: rest671)) => let val  result = MlyValue.printStmt ((*#line 217.80 "c.grm"*)Ast.printing (singlePrintStmt )(*#line 807.1 "c.grm.sml"*)
)
 in ( LrTable.NT 38, ( result, singlePrintStmt1left, SEMICOLON1right), rest671)
end
|  ( 50, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 219.70 "c.grm"*)Ast.assign (mutable , expression)(*#line 811.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, mutable1left, expression1right), rest671)
end
|  ( 51, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 220.70 "c.grm"*)Ast.assignPlus (mutable , expression)(*#line 815.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, mutable1left, expression1right), rest671)
end
|  ( 52, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 221.70 "c.grm"*)Ast.assignMinus (mutable , expression)(*#line 819.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, mutable1left, expression1right), rest671)
end
|  ( 53, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 222.70 "c.grm"*)Ast.assignMult (mutable , expression)(*#line 823.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, mutable1left, expression1right), rest671)
end
|  ( 54, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 223.70 "c.grm"*)Ast.assignDiv (mutable , expression)(*#line 827.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, mutable1left, expression1right), rest671)
end
|  ( 55, ( ( _, ( _, _, INC1right)) :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 224.70 "c.grm"*)Ast.increment (mutable)(*#line 831.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, mutable1left, INC1right), rest671)
end
|  ( 56, ( ( _, ( _, _, DEC1right)) :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.expression ((*#line 225.70 "c.grm"*)Ast.decrement (mutable)(*#line 835.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, mutable1left, DEC1right), rest671)
end
|  ( 57, ( ( _, ( MlyValue.simpleExpression simpleExpression, simpleExpression1left, simpleExpression1right)) :: rest671)) => let val  result = MlyValue.expression ((*#line 226.70 "c.grm"*)Ast.plainExpression (simpleExpression)(*#line 839.1 "c.grm.sml"*)
)
 in ( LrTable.NT 23, ( result, simpleExpression1left, simpleExpression1right), rest671)
end
|  ( 58, ( ( _, ( MlyValue.andExpression andExpression, _, andExpression1right)) :: _ :: ( _, ( MlyValue.simpleExpression simpleExpression, simpleExpression1left, _)) :: rest671)) => let val  result = MlyValue.simpleExpression ((*#line 228.70 "c.grm"*)Ast.or(simpleExpression , andExpression)(*#line 843.1 "c.grm.sml"*)
)
 in ( LrTable.NT 24, ( result, simpleExpression1left, andExpression1right), rest671)
end
|  ( 59, ( ( _, ( MlyValue.andExpression andExpression, andExpression1left, andExpression1right)) :: rest671)) => let val  result = MlyValue.simpleExpression ((*#line 229.70 "c.grm"*)Ast.noOr (andExpression) (*#line 847.1 "c.grm.sml"*)
)
 in ( LrTable.NT 24, ( result, andExpression1left, andExpression1right), rest671)
end
|  ( 60, ( ( _, ( MlyValue.unaryRelExpression unaryRelExpression, _, unaryRelExpression1right)) :: _ :: ( _, ( MlyValue.andExpression andExpression, andExpression1left, _)) :: rest671)) => let val  result = MlyValue.andExpression ((*#line 231.70 "c.grm"*)Ast.simpleAnd (andExpression , unaryRelExpression)(*#line 851.1 "c.grm.sml"*)
)
 in ( LrTable.NT 25, ( result, andExpression1left, unaryRelExpression1right), rest671)
end
|  ( 61, ( ( _, ( MlyValue.unaryRelExpression unaryRelExpression, unaryRelExpression1left, unaryRelExpression1right)) :: rest671)) => let val  result = MlyValue.andExpression ((*#line 232.70 "c.grm"*)Ast.uExpr (unaryRelExpression)(*#line 855.1 "c.grm.sml"*)
)
 in ( LrTable.NT 25, ( result, unaryRelExpression1left, unaryRelExpression1right), rest671)
end
|  ( 62, ( ( _, ( MlyValue.unaryRelExpression unaryRelExpression, _, unaryRelExpression1right)) :: ( _, ( _, NOT1left, _)) :: rest671)) => let val  result = MlyValue.unaryRelExpression ((*#line 234.70 "c.grm"*)Ast.not (unaryRelExpression)(*#line 859.1 "c.grm.sml"*)
)
 in ( LrTable.NT 26, ( result, NOT1left, unaryRelExpression1right), rest671)
end
|  ( 63, ( ( _, ( MlyValue.relExpression relExpression, relExpression1left, relExpression1right)) :: rest671)) => let val  result = MlyValue.unaryRelExpression ((*#line 235.71 "c.grm"*)Ast.rExpr (relExpression)(*#line 863.1 "c.grm.sml"*)
)
 in ( LrTable.NT 26, ( result, relExpression1left, relExpression1right), rest671)
end
|  ( 64, ( ( _, ( MlyValue.sumExpression sumExpression2, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression1, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 237.78 "c.grm"*)Ast.relExp (sumExpression1 , Ast.LTE , sumExpression2 )(*#line 867.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 65, ( ( _, ( MlyValue.sumExpression sumExpression2, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression1, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 238.79 "c.grm"*)Ast.relExp (sumExpression1 , Ast.LT , sumExpression2 )(*#line 871.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 66, ( ( _, ( MlyValue.sumExpression sumExpression2, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression1, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 239.78 "c.grm"*)Ast.relExp (sumExpression1 , Ast.GTE , sumExpression2 )(*#line 875.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 67, ( ( _, ( MlyValue.sumExpression sumExpression2, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression1, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 240.78 "c.grm"*)Ast.relExp (sumExpression1 , Ast.GT , sumExpression2 )(*#line 879.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 68, ( ( _, ( MlyValue.sumExpression sumExpression2, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression1, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 241.78 "c.grm"*)Ast.relExp (sumExpression1 , Ast.EQ , sumExpression2 )(*#line 883.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 69, ( ( _, ( MlyValue.sumExpression sumExpression2, _, sumExpression2right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression1, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 242.78 "c.grm"*)Ast.relExp (sumExpression1 , Ast.NEQ , sumExpression2 )(*#line 887.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, sumExpression1left, sumExpression2right), rest671)
end
|  ( 70, ( ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, sumExpression1right)) :: rest671)) => let val  result = MlyValue.relExpression ((*#line 243.79 "c.grm"*)Ast.noRel (sumExpression)(*#line 891.1 "c.grm.sml"*)
)
 in ( LrTable.NT 27, ( result, sumExpression1left, sumExpression1right), rest671)
end
|  ( 71, ( ( _, ( MlyValue.term term, _, term1right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.sumExpression ((*#line 245.77 "c.grm"*)Ast.sumExp (sumExpression , Ast.PLUS , term)(*#line 895.1 "c.grm.sml"*)
)
 in ( LrTable.NT 28, ( result, sumExpression1left, term1right), rest671)
end
|  ( 72, ( ( _, ( MlyValue.term term, _, term1right)) :: _ :: ( _, ( MlyValue.sumExpression sumExpression, sumExpression1left, _)) :: rest671)) => let val  result = MlyValue.sumExpression ((*#line 246.78 "c.grm"*)Ast.sumExp (sumExpression , Ast.MINUS , term)(*#line 899.1 "c.grm.sml"*)
)
 in ( LrTable.NT 28, ( result, sumExpression1left, term1right), rest671)
end
|  ( 73, ( ( _, ( MlyValue.term term, term1left, term1right)) :: rest671)) => let val  result = MlyValue.sumExpression ((*#line 247.78 "c.grm"*)Ast.noSum (term)(*#line 903.1 "c.grm.sml"*)
)
 in ( LrTable.NT 28, ( result, term1left, term1right), rest671)
end
|  ( 74, ( ( _, ( MlyValue.unaryExpression unaryExpression, _, unaryExpression1right)) :: _ :: ( _, ( MlyValue.term term, term1left, _)) :: rest671)) => let val  result = MlyValue.term ((*#line 249.77 "c.grm"*)Ast.multExp (term , Ast.MULT , unaryExpression)(*#line 907.1 "c.grm.sml"*)
)
 in ( LrTable.NT 29, ( result, term1left, unaryExpression1right), rest671)
end
|  ( 75, ( ( _, ( MlyValue.unaryExpression unaryExpression, _, unaryExpression1right)) :: _ :: ( _, ( MlyValue.term term, term1left, _)) :: rest671)) => let val  result = MlyValue.term ((*#line 250.77 "c.grm"*)Ast.multExp (term , Ast.DIV , unaryExpression)(*#line 911.1 "c.grm.sml"*)
)
 in ( LrTable.NT 29, ( result, term1left, unaryExpression1right), rest671)
end
|  ( 76, ( ( _, ( MlyValue.unaryExpression unaryExpression, _, unaryExpression1right)) :: _ :: ( _, ( MlyValue.term term, term1left, _)) :: rest671)) => let val  result = MlyValue.term ((*#line 251.77 "c.grm"*)Ast.multExp (term , Ast.MOD , unaryExpression)(*#line 915.1 "c.grm.sml"*)
)
 in ( LrTable.NT 29, ( result, term1left, unaryExpression1right), rest671)
end
|  ( 77, ( ( _, ( MlyValue.unaryExpression unaryExpression, unaryExpression1left, unaryExpression1right)) :: rest671)) => let val  result = MlyValue.term ((*#line 252.77 "c.grm"*)Ast.noMult (unaryExpression)(*#line 919.1 "c.grm.sml"*)
)
 in ( LrTable.NT 29, ( result, unaryExpression1left, unaryExpression1right), rest671)
end
|  ( 78, ( ( _, ( MlyValue.unaryExpression unaryExpression, _, unaryExpression1right)) :: ( _, ( _, MINUS1left, _)) :: rest671)) => let val  result = MlyValue.unaryExpression ((*#line 254.77 "c.grm"*)Ast.uExp (Ast.DASH , unaryExpression)(*#line 923.1 "c.grm.sml"*)
)
 in ( LrTable.NT 30, ( result, MINUS1left, unaryExpression1right), rest671)
end
|  ( 79, ( ( _, ( MlyValue.factor factor, factor1left, factor1right)) :: rest671)) => let val  result = MlyValue.unaryExpression ((*#line 255.77 "c.grm"*)Ast.noUnary (factor)(*#line 927.1 "c.grm.sml"*)
)
 in ( LrTable.NT 30, ( result, factor1left, factor1right), rest671)
end
|  ( 80, ( ( _, ( MlyValue.immutable immutable, immutable1left, immutable1right)) :: rest671)) => let val  result = MlyValue.factor ((*#line 257.77 "c.grm"*)Ast.immut (immutable)(*#line 931.1 "c.grm.sml"*)
)
 in ( LrTable.NT 31, ( result, immutable1left, immutable1right), rest671)
end
|  ( 81, ( ( _, ( MlyValue.mutable mutable, mutable1left, mutable1right)) :: rest671)) => let val  result = MlyValue.factor ((*#line 258.77 "c.grm"*)Ast.mut (mutable)(*#line 935.1 "c.grm.sml"*)
)
 in ( LrTable.NT 31, ( result, mutable1left, mutable1right), rest671)
end
|  ( 82, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) => let val  result = MlyValue.mutable ((*#line 260.84 "c.grm"*)Ast.mID (ID)(*#line 939.1 "c.grm.sml"*)
)
 in ( LrTable.NT 32, ( result, ID1left, ID1right), rest671)
end
|  ( 83, ( ( _, ( _, _, RIGHTBRACKET1right)) :: ( _, ( MlyValue.expression expression, _, _)) :: _ :: ( _, ( MlyValue.mutable mutable, mutable1left, _)) :: rest671)) => let val  result = MlyValue.mutable ((*#line 261.77 "c.grm"*)Ast.mArray (mutable , expression )(*#line 943.1 "c.grm.sml"*)
)
 in ( LrTable.NT 32, ( result, mutable1left, RIGHTBRACKET1right), rest671)
end
|  ( 84, ( ( _, ( _, _, RPARA1right)) :: ( _, ( MlyValue.expression expression, _, _)) :: ( _, ( _, LPARA1left, _)) :: rest671)) => let val  result = MlyValue.immutable ((*#line 264.78 "c.grm"*)Ast.paranthesis(expression)(*#line 947.1 "c.grm.sml"*)
)
 in ( LrTable.NT 33, ( result, LPARA1left, RPARA1right), rest671)
end
|  ( 85, ( ( _, ( MlyValue.call call, call1left, call1right)) :: rest671)) => let val  result = MlyValue.immutable ((*#line 265.78 "c.grm"*)Ast.c (call)(*#line 951.1 "c.grm.sml"*)
)
 in ( LrTable.NT 33, ( result, call1left, call1right), rest671)
end
|  ( 86, ( ( _, ( MlyValue.constant constant, constant1left, constant1right)) :: rest671)) => let val  result = MlyValue.immutable ((*#line 266.78 "c.grm"*)Ast.const (constant)(*#line 955.1 "c.grm.sml"*)
)
 in ( LrTable.NT 33, ( result, constant1left, constant1right), rest671)
end
|  ( 87, ( ( _, ( _, _, RPARA1right)) :: ( _, ( MlyValue.args args, _, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = MlyValue.call ((*#line 268.78 "c.grm"*)Ast.callArgs (ID , args)(*#line 959.1 "c.grm.sml"*)
)
 in ( LrTable.NT 34, ( result, ID1left, RPARA1right), rest671)
end
|  ( 88, ( rest671)) => let val  result = MlyValue.args ((*#line 270.82 "c.grm"*)[](*#line 963.1 "c.grm.sml"*)
)
 in ( LrTable.NT 36, ( result, defaultPos, defaultPos), rest671)
end
|  ( 89, ( ( _, ( MlyValue.argList argList, argList1left, argList1right)) :: rest671)) => let val  result = MlyValue.args ((*#line 271.82 "c.grm"*)argList(*#line 967.1 "c.grm.sml"*)
)
 in ( LrTable.NT 36, ( result, argList1left, argList1right), rest671)
end
|  ( 90, ( ( _, ( MlyValue.expression expression, _, expression1right)) :: _ :: ( _, ( MlyValue.argList argList, argList1left, _)) :: rest671)) => let val  result = MlyValue.argList ((*#line 273.84 "c.grm"*)argList @ [expression](*#line 971.1 "c.grm.sml"*)
)
 in ( LrTable.NT 35, ( result, argList1left, expression1right), rest671)
end
|  ( 91, ( ( _, ( MlyValue.expression expression, expression1left, expression1right)) :: rest671)) => let val  result = MlyValue.argList ((*#line 274.82 "c.grm"*)[expression](*#line 975.1 "c.grm.sml"*)
)
 in ( LrTable.NT 35, ( result, expression1left, expression1right), rest671)
end
|  ( 92, ( ( _, ( MlyValue.NUMCONST NUMCONST, NUMCONST1left, NUMCONST1right)) :: rest671)) => let val  result = MlyValue.constant ((*#line 276.82 "c.grm"*)Ast.number(NUMCONST)(*#line 979.1 "c.grm.sml"*)
)
 in ( LrTable.NT 37, ( result, NUMCONST1left, NUMCONST1right), rest671)
end
|  ( 93, ( ( _, ( MlyValue.CHARCONST CHARCONST, CHARCONST1left, CHARCONST1right)) :: rest671)) => let val  result = MlyValue.constant ((*#line 277.82 "c.grm"*)Ast.charConst (CHARCONST)(*#line 983.1 "c.grm.sml"*)
)
 in ( LrTable.NT 37, ( result, CHARCONST1left, CHARCONST1right), rest671)
end
|  ( 94, ( ( _, ( _, TRUE1left, TRUE1right)) :: rest671)) => let val  result = MlyValue.constant ((*#line 278.82 "c.grm"*)Ast.trueValue(*#line 987.1 "c.grm.sml"*)
)
 in ( LrTable.NT 37, ( result, TRUE1left, TRUE1right), rest671)
end
|  ( 95, ( ( _, ( _, FALSE1left, FALSE1right)) :: rest671)) => let val  result = MlyValue.constant ((*#line 279.82 "c.grm"*)Ast.falseValue(*#line 991.1 "c.grm.sml"*)
)
 in ( LrTable.NT 37, ( result, FALSE1left, FALSE1right), rest671)
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
fun HEADER (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(ParserData.MlyValue.HEADER i,p1,p2))
fun HEADERn (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(ParserData.MlyValue.HEADERn i,p1,p2))
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(ParserData.MlyValue.VOID',p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(ParserData.MlyValue.ID i,p1,p2))
fun LEFTBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(ParserData.MlyValue.VOID',p1,p2))
fun RIGHTBRACE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(ParserData.MlyValue.VOID',p1,p2))
fun COMMA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(ParserData.MlyValue.VOID',p1,p2))
fun SEMICOLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(ParserData.MlyValue.VOID',p1,p2))
fun COLON (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(ParserData.MlyValue.VOID',p1,p2))
fun LEFTBRACKET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(ParserData.MlyValue.VOID',p1,p2))
fun RIGHTBRACKET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(ParserData.MlyValue.VOID',p1,p2))
fun STATIC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(ParserData.MlyValue.VOID',p1,p2))
fun LPARA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(ParserData.MlyValue.VOID',p1,p2))
fun RPARA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(ParserData.MlyValue.VOID',p1,p2))
fun INT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(ParserData.MlyValue.VOID',p1,p2))
fun BOOL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(ParserData.MlyValue.VOID',p1,p2))
fun CHAR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(ParserData.MlyValue.VOID',p1,p2))
fun VOID (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(ParserData.MlyValue.VOID',p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(ParserData.MlyValue.VOID',p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(ParserData.MlyValue.VOID',p1,p2))
fun WHILE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(ParserData.MlyValue.VOID',p1,p2))
fun FOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(ParserData.MlyValue.VOID',p1,p2))
fun RETURN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(ParserData.MlyValue.VOID',p1,p2))
fun BREAK (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(ParserData.MlyValue.VOID',p1,p2))
fun CONTINUE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(ParserData.MlyValue.VOID',p1,p2))
fun EQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(ParserData.MlyValue.VOID',p1,p2))
fun PLUSEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(ParserData.MlyValue.VOID',p1,p2))
fun MINUSEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(ParserData.MlyValue.VOID',p1,p2))
fun MULTEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(ParserData.MlyValue.VOID',p1,p2))
fun DIVEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(ParserData.MlyValue.VOID',p1,p2))
fun INC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(ParserData.MlyValue.VOID',p1,p2))
fun DEC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(ParserData.MlyValue.VOID',p1,p2))
fun OR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(ParserData.MlyValue.VOID',p1,p2))
fun AND (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(ParserData.MlyValue.VOID',p1,p2))
fun NOT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(ParserData.MlyValue.VOID',p1,p2))
fun LESSEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(ParserData.MlyValue.VOID',p1,p2))
fun LESS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(ParserData.MlyValue.VOID',p1,p2))
fun GREATER (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(ParserData.MlyValue.VOID',p1,p2))
fun GREATEREQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(ParserData.MlyValue.VOID',p1,p2))
fun EQUALEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(ParserData.MlyValue.VOID',p1,p2))
fun NOTEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(ParserData.MlyValue.VOID',p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(ParserData.MlyValue.VOID',p1,p2))
fun MINUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(ParserData.MlyValue.VOID',p1,p2))
fun MULT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 44,(ParserData.MlyValue.VOID',p1,p2))
fun DIV (p1,p2) = Token.TOKEN (ParserData.LrTable.T 45,(ParserData.MlyValue.VOID',p1,p2))
fun MOD (p1,p2) = Token.TOKEN (ParserData.LrTable.T 46,(ParserData.MlyValue.VOID',p1,p2))
fun QUES (p1,p2) = Token.TOKEN (ParserData.LrTable.T 47,(ParserData.MlyValue.VOID',p1,p2))
fun DASH (p1,p2) = Token.TOKEN (ParserData.LrTable.T 48,(ParserData.MlyValue.VOID',p1,p2))
fun STAR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 49,(ParserData.MlyValue.VOID',p1,p2))
fun NUMCONST (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 50,(ParserData.MlyValue.NUMCONST i,p1,p2))
fun CHARCONST (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 51,(ParserData.MlyValue.CHARCONST i,p1,p2))
fun TRUE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 52,(ParserData.MlyValue.VOID',p1,p2))
fun FALSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 53,(ParserData.MlyValue.VOID',p1,p2))
fun iff (p1,p2) = Token.TOKEN (ParserData.LrTable.T 54,(ParserData.MlyValue.VOID',p1,p2))
fun c (p1,p2) = Token.TOKEN (ParserData.LrTable.T 55,(ParserData.MlyValue.VOID',p1,p2))
fun COLONEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 56,(ParserData.MlyValue.VOID',p1,p2))
fun COUT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 57,(ParserData.MlyValue.VOID',p1,p2))
fun LLBRACKET (p1,p2) = Token.TOKEN (ParserData.LrTable.T 58,(ParserData.MlyValue.VOID',p1,p2))
end
end

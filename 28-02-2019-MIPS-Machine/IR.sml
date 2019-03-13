structure  TREE = 
struct
    datatype  exp = CONST of int
                    | NAME of Temp.label
                    | TEMP of Temp.temp
                    | BINOP of binop * exp * exp
                    | MEM of exp
                    | CALL of exp * exp list
                    | ESEQ of stm * exp
    and stm = MOVE of exp * exp
            | EXP of exp
            | JUMP of exp * Temp.label list
            | CJUMP of relop * exp * exp * Temp.label * Temp.label
            | SEQ of stm * stm
            | LABEL of Temp.label
    and binop = PLUS | MINUS | MUL | DIV | AND | OR | LSHIFT | RSHIFT | ARSHIFT | XOR
    and relop = EQ | NE | LT | GT | LE | GE | ULT | UGT | ULE | UGE
end

structure Translate = 
struct 
    open TREE;
    fun print_Binop (PLUS) = print " + "
        | print_Binop (MINUS) = print " - "
        | print_Binop (MUL) = print " * "
        | print_Binop (DIV) = print " / "
        | print_Binop (AND) = print " & "
        | print_Binop (OR) = print " | "
        | print_Binop (LSHIFT) = print " >> "
        | print_Binop (RSHIFT) = print " << "
        | print_Binop (ARSHIFT) = print " <<r "
        | print_Binop (XOR) = print " ^ "

    fun print_Relop (EQ) = print " == "
    | print_Relop (NE) = print " != "
    | print_Relop (LT) = print " < "
    | print_Relop (GT) = print " > "
    | print_Relop (LE) = print " <= "
    | print_Relop (GE) = print " >= "
    | print_Relop (ULT) = print " < "
    | print_Relop (UGT) = print " > "
    | print_Relop (ULE) = print " <= "
    | print_Relop (UGE) = print " >= " 

    fun exp_to_mips (CONST(x)) = (print " " ;  print(Int.toString x) ; print " ")
        | exp_to_mips (NAME(x)) = (print " " ; Temp.printLabel x  ; print " " )
        | exp_to_mips (TEMP(x)) = (print " " ; Temp.printTemp x ; print " ")
        | exp_to_mips BINOP(op,x,y)  = (exp_to_mips x ; print_Binop op ; exp_to_mips y)
        (* | exp_to_mips (MEM (x)) = (print "MEM [" ; exp_to_mips x ; print " ]")
        | exp_to_mips (CALL (x , y)) = (print "CALL " ; exp_to_mips x ; map exp_to_mips y) *)
end 
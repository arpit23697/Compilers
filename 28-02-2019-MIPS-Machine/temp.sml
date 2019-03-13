(* Signature for the temp *)
signature TEMP = sig
    type temp  (* temporary variables of your program *)
    type label (* temporary labels for your program *)
    val newLabel : unit -> label
    val newTemp  : unit -> temp
    
    val printLabel : label -> unit
    val printTemp : temp -> unit
end

(* Structure for the temp *)
structure Temp:>TEMP = struct 
    type temp = string
    type label = string

    val counter_temp = ref 0;
    val counter_label = ref 0;

    fun newLabel () = (counter_label := !counter_label + 1 ; 
                        "r" ^ Int.toString (!counter_label)
                        ) 

    fun newTemp () = (counter_temp := !counter_temp + 1;
                        "l" ^ Int.toString (!counter_temp)
                        )

    fun printLabel x = print(x)
    fun printTemp x = print(x) 

end





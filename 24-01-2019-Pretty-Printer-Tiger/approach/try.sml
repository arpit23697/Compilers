val n = ref 5
fun fact () = if !n = 0 then ( print("")) else (n := !n - 1 ; print ("\t") ; fact ());
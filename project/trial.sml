structure temp = struct
(* fun hasNewline x = let 
                    val t = String.explode(x)
                    val t2 = List.tl t
                    fun g [x] = []
                        | g (x::xs) = x :: g xs
                        | g [] = []

                    val t3 = g t2 
                    fun f [] = ""
                        | f (x::xs) = if Char.compare (x , #"\n") = EQUAL
                                        then 
                                        (
                                        "<br>" ^ f xs)
                                        else 
                                        (
                                        (Char.toString (x)) ^ f xs)
                    in 
                        ("\"" ^ f t3 ^ "\"")
                    end *)
fun tempFunc #"\n" = "<br>"
    | tempFunc #"\"" = "\""
    | tempFunc x = Char.toString (x)

fun hasNewline x = String.translate tempFunc x
val t = print (hasNewline "\"arp\n\"" )
end
structure print =
struct

fun print_red x = print ("\027[1;31m " ^ x ^" \027[0m \n");
fun print_white x = print ("\027[1;37m " ^ x ^" \027[0m \n");
fun print_green x = print ("\027[1;32m " ^ x ^" \027[0m \n");
fun print_yellow x = print ("\027[1;33m " ^ x ^" \027[0m \n");
fun print_blue x = print ("\027[1;34m " ^ x ^" \027[0m \n");
fun print_magneta x = print ("\027[1;35m " ^ x ^" \027[0m \n");
fun print_cyan x = print ("\027[1;36m " ^ x ^" \027[0m \n");
end
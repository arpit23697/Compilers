structure Parse =
struct 
  fun parse filename =
      let val file = TextIO.openIn filename
	  fun get _ = TextIO.input file
	  val lexer = Mlex.makeLexer get
      
	  fun do_it() =
	      let val (t,x) = lexer()
	       in if (x = "red") then print.print_red t
              else if (x = "green") then print.print_green t 
              else if (x = "blue") then print.print_blue t 
              else if (x = "yellow") then print.print_yellow t 
              else if (x = "white") then print.print_white t 
              else if (x = "magneta") then print.print_magneta t
              else if (x = "default") then print.print_default t
              else print.print_cyan t; 
		   if x="EOF" then print("\n") else do_it()
	      end

       in do_it();
	  TextIO.closeIn file
      end

end


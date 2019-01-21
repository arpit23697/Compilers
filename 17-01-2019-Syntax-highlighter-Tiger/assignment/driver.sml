structure Parse =
struct 
  fun parse filename =
      let val file = TextIO.openIn filename
	  fun get _ = TextIO.input file
	  val lexer = Mlex.makeLexer get
      
	  fun do_it(count) =
	      let val t = lexer()
	       in if (count mod 7 = 0) then print.print_red t
              else if (count mod 7 = 1) then print.print_green t 
              else if (count mod 7 = 2) then print.print_blue t 
              else if (count mod 7 = 3) then print.print_yellow t 
              else if (count mod 7 = 4) then print.print_white t 
              else if (count mod 7 = 5) then print.print_magneta t
              else print.print_cyan t; 
		   if substring(t,0,3)="EOF" then () else do_it(count + 1)
	      end

       in do_it(0);
	  TextIO.closeIn file
      end

end
%.lex.sml  : %.lex
			mllex $<

all 		: source

clean 		: 
			rm -rf *.lex.sml source

source 		: tokens.sig tokens.sml print.sml errrormsg.sml tiger.lex.sml driver.sml run.sml source.mlb
			mlton source.mlb

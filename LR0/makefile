all       : source
clean     : 
			rm -rf source

source    : grammar.sml createGrammer.sml nullable.sml first.sml follow.sml ll1.sml lr0.sml slr1.sml source.mlb
			mlton source.mlb

test : all 
	 ${CURDIR}/source 
%.lex.sml :  %.lex  
			mllex $<

%.grm.sml : %.grm
			mlyacc $<

all       : source
clean     : 
			rm -rf *.lex.sml *.grm.sml *.grm.sig *.grm.desc source

source    : ast.sml translate.sml c.grm c.grm.sml c.lex.sml ec.sml source.mlb
		mlton source.mlb

test : all 
	 ${CURDIR}/source  main.c
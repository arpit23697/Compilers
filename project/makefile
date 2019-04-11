%.lex.sml :  %.lex  
			mllex $<

%.grm.sml : %.grm
			mlyacc $<

all       : source
clean     : 
			rm -rf *.lex.sml *.grm.sml *.grm.sig *.grm.desc source

source    :stack.sml ast.sml printColor.sml translate.sml code_gen.sml c.grm c.grm.sml c.lex.sml  semantic.sml cType.sml ec.sml symbol_tables.sml  source.mlb
		mlton source.mlb

test : all 
	 ${CURDIR}/source test_cases/test5.cpp
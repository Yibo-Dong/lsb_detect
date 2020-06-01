flex.c : string.l
	flex string.l

lexer.exe: flex.c
	gcc flex.c -o lexer.exe

clean : 
	@rm -f flex.c *.exe 

lexer.exe: flex.c
	gcc flex.c -o lexer.exe

flex.c : string.l
	flex string.l

.PHONY : clean
clean : 
	@rm -f flex.c *.exe string.txt *.so

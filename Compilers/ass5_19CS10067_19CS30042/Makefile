test: a.out
	
	@echo "TRANSLATING TEST FILE 1 \n(2D ARRAYS and LOOPS)==>"
	./a.out < ass5_19CS10067_19CS30042_test1.c > ass5_19CS10067_19CS30042_quads1.out
	@echo "Test File 1 Successfully Translated !\n"

	@echo "TRANSLATING TEST FILE 2 \n(TYPE CASTING AND POINTERS)==>"
	./a.out < ass5_19CS10067_19CS30042_test2.c > ass5_19CS10067_19CS30042_quads2.out
	@echo "Test File 2 Successfully Translated !\n"
	
	@echo "TRANSLATING TEST FILE 3 \n(ARITHMETIC EXPRESSIONS AND NESTED BLOCKS)==>"
	./a.out < ass5_19CS10067_19CS30042_test3.c > ass5_19CS10067_19CS30042_quads3.out
	@echo "Test File 3 Successfully Translated !\n"
	
	@echo "TRANSLATING TEST FILE 4 \n(FUNCTION CALL, TERNARY, IF-ELSE)==>"
	./a.out < ass5_19CS10067_19CS30042_test4.c > ass5_19CS10067_19CS30042_quads4.out
	@echo "Test File 4 Successfully Translated !\n"
	
	@echo "TRANSLATING TEST FILE 5 \n(NESTED IF-ELSE)==>"
	./a.out < ass5_19CS10067_19CS30042_test5.c > ass5_19CS10067_19CS30042_quads5.out
	@echo "Test File 5 Successfully Translated !\n"
	
	@echo "TRANSLATING TEST FILE 6 ==>"
	./a.out < ass5_19CS10067_19CS30042_test6.c > ass5_19CS10067_19CS30042_quads6.out
	@echo "Test File 6 Successfully Translated !\n"
	
	@echo "TRANSLATING TEST FILE 7 \n(UNCONDITIONAL JUMP GOTO)==>"
	./a.out < ass5_19CS10067_19CS30042_test7.c > ass5_19CS10067_19CS30042_quads7.out
	@echo "Test File 7 Successfully Translated !\n"
	
	@echo "TRANSLATING TEST FILE 8 \n(NESTED FOR WHILE DO_WHILE BOOLEAN)==>"
	./a.out < ass5_19CS10067_19CS30042_test8.c > ass5_19CS10067_19CS30042_quads8.out
	@echo "Test File 8 Successfully Translated !\n"

	@echo "\nALL TEST FILES SUCCESSFULLY TRANSLATED !!\n"

a.out: lex.yy.o ass5_19CS10067_19CS30042.tab.o ass5_19CS10067_19CS30042_translator.o
	g++ lex.yy.o ass5_19CS10067_19CS30042.tab.o ass5_19CS10067_19CS30042_translator.o -lfl

ass5_19CS10067_19CS30042_translator.o: ass5_19CS10067_19CS30042_translator.cxx ass5_19CS10067_19CS30042_translator.h
	g++ -c ass5_19CS10067_19CS30042_translator.h
	g++ -c ass5_19CS10067_19CS30042_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

ass5_19CS10067_19CS30042.tab.o: ass5_19CS10067_19CS30042.tab.c
	g++ -c ass5_19CS10067_19CS30042.tab.c

lex.yy.c: ass5_19CS10067_19CS30042.l ass5_19CS10067_19CS30042.tab.h ass5_19CS10067_19CS30042_translator.h
	flex ass5_19CS10067_19CS30042.l

ass5_19CS10067_19CS30042.tab.c: ass5_19CS10067_19CS30042.y
	bison -dtv ass5_19CS10067_19CS30042.y -W

ass5_19CS10067_19CS30042.tab.h: ass5_19CS10067_19CS30042.y
	bison -dtv ass5_19CS10067_19CS30042.y -W

clean:
	rm lex.yy.c\
	   lex.yy.o\
	   a.out\
	   ass5_19CS10067_19CS30042.tab.c\
	   ass5_19CS10067_19CS30042.tab.h\
	   ass5_19CS10067_19CS30042.tab.o\
	   ass5_19CS10067_19CS30042.output\
	   ass5_19CS10067_19CS30042_translator.o\
	   ass5_19CS10067_19CS30042_translator.h.gch\
	   ass5_19CS10067_19CS30042_quads1.out\
	   ass5_19CS10067_19CS30042_quads2.out\
	   ass5_19CS10067_19CS30042_quads3.out\
	   ass5_19CS10067_19CS30042_quads4.out\
	   ass5_19CS10067_19CS30042_quads5.out\
	   ass5_19CS10067_19CS30042_quads6.out\
	   ass5_19CS10067_19CS30042_quads7.out\
	   ass5_19CS10067_19CS30042_quads8.out

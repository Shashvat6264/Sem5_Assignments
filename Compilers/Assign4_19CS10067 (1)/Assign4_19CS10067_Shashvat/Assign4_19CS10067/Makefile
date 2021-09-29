asgn4_19CS10067_19CS30042.txt: a.out asgn4_19CS10067_19CS30042_test.c
	./a.out < asgn4_19CS10067_19CS30042_test.c > asgn4_19CS10067_19CS30042.txt

a.out: lex.yy.o asgn4_19CS10067_19CS30042.o y.tab.o
	gcc lex.yy.o y.tab.o asgn4_19CS10067_19CS30042.o -lfl 

lex.yy.o: lex.yy.c 
	gcc -c lex.yy.c 

y.tab.o: y.tab.c 
	gcc -c y.tab.c

asgn4_19CS10067_19CS30042.o: asgn4_19CS10067_19CS30042.c 
	gcc -c asgn4_19CS10067_19CS30042.c 

lex.yy.c: asgn4_19CS10067_19CS30042.l y.tab.h
	flex asgn4_19CS10067_19CS30042.l

y.tab.c: asgn4_19CS10067_19CS30042.y 
	bison -dy -v asgn4_19CS10067_19CS30042.y --report=solved 

y.tab.h: asgn4_19CS10067_19CS30042.y
	bison -dy -v asgn4_19CS10067_19CS30042.y --report=solved 

clean:
	rm a.out lex.yy.* y.output asgn4_19CS10067_19CS30042.o y.tab.*
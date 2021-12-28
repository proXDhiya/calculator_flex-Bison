# compile code.y from bison to c
bison -d -y code.y

# compile code.l from flex to c
flex code.l

# compile code.tab.c code.tab.h lex.yy.c to binary file
gcc lex.yy.c y.tab.c -o calc.out -lm

# remove code.tab.c code.tab.h lex.yy.c
rm y.tab.c y.tab.h lex.yy.c

# run code.out
./calc.out

# remove code.out
rm calc.out

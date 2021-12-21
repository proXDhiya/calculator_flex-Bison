# compile code.l from flex to c
flex code.l


# compile code.y from bison to c
bison -dy code.y

# compile code.tab.c code.tab.h lex.yy.c to binary file
gcc lex.yy.c y.tab.c -o code.out

# remove code.tab.c code.tab.h lex.yy.c
rm y.tab.c y.tab.h lex.yy.c

# run code.out
./code.out

# remove code.out
rm code.out

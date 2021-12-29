%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	#define YYSTYPE double
	int yylex(void);
	void yyerror(char*);
%}

%token INT
%token EOL
%token PRNL PRNR
%token ABS SIN COS SQRT EXP POW PI
%token EXIT CLEAR
%left ADD SUB
%left MUL DIV

%%

strt: strt expr EOL		{ printf("= %.2lf\n", $2); }
	| strt EOL		{ printf("\n"); }
	| strt EXIT		{ printf(">> Bye!\n"); exit(0); }
	| strt CLEAR		{ system("clear"); }
	|
;

expr: expr ADD term		{ $$ = $1 + $3; }
	| expr SUB term		{ $$ = $1 - $3; }
	| term			{ $$ = $1; }
;

term: term MUL unary		{ $$ = $1 * $3; }
	| term DIV unary	{ $$ = $1 / $3; }
	| unary			{ $$ = $1; }
;

unary: SUB expr			{ $$ = $2 * -1; }
	| factor		{ $$ = $1; }
;

factor: INT			{ $$ = $1; }
	| PI			{ $$ = 3.14; }
	| expr POW expr		{ $$ = pow($1, $3); }
	| PRNL expr PRNR	{ $$ = ($2); }
	| SIN PRNL expr PRNR	{ $$ = sin($3); }
	| COS PRNL expr PRNR	{ $$ = cos($3); }
	| SQRT PRNL expr PRNR	{ $$ = sqrt($3); }
	| ABS PRNL expr PRNR	{ $$ = fabs($3); }
	| EXP PRNL expr PRNR	{ $$ = exp($3); }
;

%%
void yyerror(char *s) {
	fprintf(stderr, ">> %s\n", s);
}

int main() {
	system("clear");
	yyparse();
	return 0;
}

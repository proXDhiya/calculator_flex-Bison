%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	extern int yylex();
	void yyerror(char *msg);
%}

%union {
	float f;
}

%token <f> NUM COS SIN SQRT PI
%type <f> E T F A

%%

S : E '\n'		{ printf("Result = %2.f\n", $1); }
  ;

E : E '+' T		{ $$ = $1 + $3; }
  | E '-' T		{ $$ = $1 - $3; }
  | T			{ $$ = $1; }
  ;

T : T '*' F		{ $$ = $1 * $3; }
  | T '/' F		{ $$ = $1 / $3; }
  | F			{ $$ = $1; }
  ;

F : COS '(' A ')'	{ $$ = cos($3); }
  | SIN '(' A ')'	{ $$ = sin($3); }
  | SQRT '(' A ')'	{ $$ = sqrt($3); }
  | A			{ $$ = $1; }
  ;

A : '(' E ')'		{ $$ = $2; }
  | '-' A		{ $$ = -$2; }
  | NUM			{ $$ = $1; }
  | PI			{ $$ = 3.14; }
  ;

%%

void yyerror(char *msg) {
	fprintf(stderr, "%s\n", msg);
	exit(1);
}

int main() {
	yyparse();
	return 0;
}


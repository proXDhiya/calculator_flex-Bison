%{
	#include <stdlib.h>
	#include <stdio.h>
	#include "y.tab.h"
	extern YYSTYPE yylval;
	void yyerror(char*);
%}

%option noyywrap

%%

"+"		{ printf("ADD "); return ADD; }
"-"		{ printf("SUB "); return SUB; }
"*"		{ printf("MUL "); return MUL; }
"/"		{ printf("DIV "); return DIV; }
"^"		{ printf("POW "); return POW; }
"("		{ printf("PRNL "); return PRNL; }
")"		{ printf("PRNR "); return PRNR; }
"sin"	{ printf("SIN "); return SIN; }
"cos"	{ printf("COS "); return COS; }
"sqrt"	{ printf("SQRT "); return SQRT; }
"exp"	{ printf("EXP "); return EXP; }
"abs"	{ printf("ABS "); return ABS; }
"pi"	{ printf("PI "); return PI; }
"clear"	{ return CLEAR; }
[0-9]+	{ printf("INT "); sscanf(yytext, "%lf", &yylval); return INT; }
\n		{ return EOL; }
[ \t]+  { ; }
"exit"	{ return EXIT; }
.		{ yyerror("ERROR: Unrecognized input!"); }

%%


%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
%}

%option noyywrap

%%

[0-9]+(.[0-9]+)?([eE][0-9]+)?		{ yylval.f = atoi(yytext); return NUM; }
[cos]					{ return COS; }
[sin]					{ return SIN; }
[sqrt]					{ return SQRT; }
[pi]					{ return PI; }
[-+()*/\n]				{ return *yytext; }
[ \t]					{ ; }
[exit]					{ printf("EXIT!\n"); exit(1); } 

%%

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
%}

%option noyywrap

%%

[0-9]+					{ yylval.i = atoi(yytext); return NUM; }
[-+()*/\n]				{ return *yytext; }
[ \t]					{ ; }
[exit]					{ printf("EXIT!\n"); exit(1); } 
%%

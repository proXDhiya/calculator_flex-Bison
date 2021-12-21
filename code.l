%{
    #include <stdlib.h>
    void yyerror(char *);
    #include "y.tab.h"
%}

integer         [0-9]
operator        [-+*/\n]
whitespace      [ \t]

%%

{integer}+      { yylval = atoi(yytext);
                  return INTEGER; }

{operator}      { return *yytext; }

{whitespace}+   { ; }

.               { yyerror("Invalid Character!"); }

%%

int yywrap(void) {
    return 1;
}

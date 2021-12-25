%{
    #include "y.tab.h"
    void yyerror(char *);
%}

integer         [0-9]
operator        [-+()*/\n]
whitespace      [ \t]
exit            [exit]

%%

{integer}+      { yylval = atoi(yytext);
                  return INTEGER; }

{operator}      { return *yytext; }


{whitespace}+   { ; }

{exit}          { printf("caluclator exiting\n");
                  exit(0); }

.               { yyerror("Invalid Character!"); }

%%

int yywrap(void) {
    return 1;
}

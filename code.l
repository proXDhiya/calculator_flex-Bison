%{
    #include "y.tab.h"
    #include <math.h>
    void yyerror(char *);
%}

integer         [0-9]
operator        [-+()*/\n]
whitespace      [ \t]
cos             [cos]
sin             [sin]
exit            [exit]

%%

{integer}+      { yylval = atoi(yytext);
                  return INTEGER; }

{operator}      { return *yytext; }

{cos}           { return COS; }

{sin}           { return SIN; }

{whitespace}+   { ; }

{exit}          { printf("caluclator exiting\n");
                  exit(0); }

.               { yyerror("Invalid Character!"); }

%%

int yywrap(void) {
    return 1;
}

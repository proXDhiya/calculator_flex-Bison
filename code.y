%{
    #include <stdio.h>
    #include <math.h>
    #include <stdlib.h>
    #define YYSTYPE double
    int yylex(void);
    void yyerror(char *);
%}

%token INTEGER
%token COS
%token SIN


%%


program:  program '\n'          { printf("= %f\n", $1); }
          | expr
          ;

expr:     INTEGER               { $$ = $1; }
          | expr '+' expr       { $$ = $1 + $3; }
          | expr '-' expr       { $$ = $1 - $3; }
          | '-' expr            { $$ = -$2; }
          | expr '*' expr       { $$ = $1 * $3; }
          | expr '/' expr       { $$ = $1 / $3; }
          | '(' expr ')'        { $$ = $2; }
          | COS expr            { $$ = cos($2); }
          | SIN expr            { $$ = sin($2); }
          ;

%%


void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}

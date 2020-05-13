%{

#include <stdio.h>
#include <stdlib.h>

void yyerror(char *);
int yylex(void);

%}

%token INT FIM OP 
%left  OP

%%

ARQ:
   	ARQ EXPRESSAO FIM { printf("POP A\n"); }
	|
	;


EXPRESSAO:
	 INT
	 | EXPRESSAO OP EXPRESSAO			      
	 | '(' EXPRESSAO ')'
	 ;

%%

void yyerror(char *s) { printf("Expressão Inválida\n"); }

int main() {
  yyparse();
  return 0;

}

%{
#include <stdio.h>
#include <stdlib.h>
%}

%token ID
%left '+' '-'
%left '*' '/'
%left UMINUS

%%
S	:	E
E	:	E'+'{A1();}T{A2();}
	|	E'-'{A1();}T{A2();}
	|	T;
T	:	T'*'{A1();}F{A2();}
	|	T'/'{A1();}F{A2();}
	|	F;
F	:	'('E{A2();}')'
	|	'-'{A1();}F{A2();}
	|	ID{A3();};
%%
#include "lex.yy.c"
char st[100];
int top=0;
main()
{
printf("Enter infix expression: ");
yyparse();
printf("\n");
}

yywrap(){} 

yyerror() 
{ 
   printf("\nEntered arithmetic expression is Invalid\n\n");  
}
A1()
{
st[top++]=yytext[0];
}
A2()
{printf("%c",st[--top]);
}
A3()
{
printf("%c",yytext[0]);
}

%{
#include<stdio.h>
%}
%union
{
char dval;
}
%token <dval> NUM
%type <dval> E
%left '+' '-'
%left '*' '/'
%%
statement : E {printf("\n t= %c\n This is Three Address Code ...\n",$1);}
E : E '+' E {$$=intgencode($$,$1,'+',$3);}
| E '-' E {$$=intgencode($$,$1,'-',$3);}
| E '*' E {$$=intgencode($$,$1,'*',$3);}
| E '/' E {$$=intgencode($$,$1,'/',$3);}
| '(' E ')' {$$=$2;}
| NUM {$$=$1;}
;
%%
main()
{
yyparse();
return 0;
}
yywrap(){}

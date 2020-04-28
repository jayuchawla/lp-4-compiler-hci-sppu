%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
[a-z][a-zA-Z0-9]*|[0-9]+ { strcpy(yylval.vname,yytext); return NAME; }
[ |\t] ;
.|\n { return yytext[0]; }
%%

%{
#include<stdio.h>
%}
%%
float|int|char|double|long|void|include|typedef printf("%s IS A KEYWORD\n",yytext);
["|(|)|{|}|#|;|,|%|&] printf("%s IS A SPECIAL SYMBOL\n", yytext);
["]+[a-zA-Z0-9]+["] printf("%s IS A MESSAGE\n", yytext);
%[a-zA-Z] printf("%s IS A STRING CONSTANT\n", yytext);
[+|-|*|/] printf("%s IS A ARITHMATIC OPERATOR\n", yytext);
[getch|main|printf|scanf|return|clrscr] printf("%s IS A PREDEFINED FUNCTION\n", yytext);
[a-zA-Z]*.h printf("%s IS A HEADER FILE\n", yytext);
[a-zA-Z]+[a-zA-Z0-9]* printf("%s IS AN IDENTIFIER\n", yytext);
[0-9]+ printf("%s IS A CONSANT\n", yytext);
= printf("%s IS AN ASSIGNMENT OPERATOR \n", yytext);
[<|>|<=|>=|<>] printf("%s IS A RELATIONAL OPERATOR\n", yytext);
[&&|!=|==] printf("%s IS A LOGICAL OPERATOR\n", yytext);
%%
int yywrap(void)
{
return 1;
}
int main()
{
FILE *fp=fopen("code.c","r");
yyin = fp;
yylex();
yywrap();
return 0;
}
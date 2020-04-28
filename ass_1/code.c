#include<stdio.h>
#include<conio.h>
void main()
{
int a,b;
printf("\n\t the value of a,b\n");
scanf("%d,%d",&a,&b);
a=a+b;
b=a-b;
a=a-b;
printf("\n the no after swapping a=%d and b=%d ");
}
#include<stdio.h>
//#include<conio.h>
#include<stdlib.h>
#include<string.h>
//using namespace std;
struct mm
{
char op[6],op1[6],op2[6],op3[6];
int flag;
}m[20];
void rep(int i,int j,int n);
void coms();
void dead(int n);
void dis(int n);
int checkc(int i,int j);
int main()
{
int ch,i;
int n;
//clrscr();
printf("\nENTER THE NO. OF TUPLES : ");
scanf("%d",&n);
printf("\nENTER THE TUPLES NOW : \n");
for(i=0;i<n;i++)
{
scanf("%s%s%s%s",&m[i].op,&m[i].op1,&m[i].op2,&m[i].op3);
}
printf("\n\n1:COMMON SUBEXPRESSION ELIMINATION");
printf("\n2:DEAD CODE ELIMINATION");
printf("\n3:EXIT");
printf("\nENTER UR CHOICE : ");
scanf("%d",&ch);
switch(ch)
{
case 1: coms(n);
break;
case 2: dead(n);
break;
case 3:exit(0);
}return 0;
}
void coms(int n)
{
int i,j;
for(i=0;i<n;i++)
{
for(j=i;j<n;j++)
{
if(m[j].flag==1||i==j)
continue;
if((strcmp(m[i].op,m[j].op)==0)&&(strcmp(m[i].op1,m[j].op1)==0)&&(strcmp(
m[i].op2,m[j]
.op2)==0))
{
if(checkc(i,j)==0)
{
rep(i,j,n);
m[j].flag=1;
}
}
}
}
dis(n);
}
int checkc(int i,int j)
{
int k,f=0;
for(k=i+1;k<j;k++)
{
if((strcmp(m[k].op,"=")==0)&&((strcmp(m[k].op3,m[i].op1)==0)||(strcmp(m[k
].op3,m[i].op2
)==0)))
{
f=1;
}
}
return f;
}void rep(int i,int j,int n)
{
int k;
for(k=i;k<n;k++)
{
if(strcmp(m[k].op1,m[j].op3)==0)
strcpy(m[k].op1,m[i].op3);
if(strcmp(m[k].op2,m[j].op3)==0)
strcpy(m[k].op2,m[i].op3);
}
}
void dis(int n)
{
int i;
for(i=0;i<n;i++)
{
if(m[i].flag==0)
printf("\n%s\t%s\t%s\t%s",m[i].op,m[i].op1,m[i].op2,m[i].op3);
}
}
void dead(int n)
{
int i,j;
for(i=0;i<n;i++)
{
m[i].flag=1;
}
for(i=0;i<n;i++)
{
for(j=i;j<n;j++)
{
if(strcmp(m[i].op3,m[j].op1)==0||strcmp(m[i].op3,m[j].op2)==0)
m[i].flag=0;
}
}
dis(n);
}
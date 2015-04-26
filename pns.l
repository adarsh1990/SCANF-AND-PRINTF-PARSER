%{
#include<stdio.h>
#include"y.tab.h"

int a,flag=0;
%}
cs		[%][asdfx]
sc		"scanf"
st 		[ "\t"]*
pt 		"printf"
stmt 		\"[ '\t'A-Za-z0-9_=+*<>?,!@$^&*]+\"
wri		[,]
ada             [a-zA-Z][a-zA-Z]*
rea		[&]
qt              ["]
%%
{qt}				{return QT;}			
{cs}				{return CSS;}
{sc}				{return SC;}
{pt}				{return PT;}
[(] 				{return OBR;}
[)]				{return CBR;}
[;]				{return CT;}
{rea}				{return REA;}
{wri}				{flag=1;return WRI;}
{ada}				{return ADA;}
{st}*				{return ST;}		
{stmt} 				{return STMT;}
[\n]				{++a;}				
.				{return(0);}
			
%%
 	

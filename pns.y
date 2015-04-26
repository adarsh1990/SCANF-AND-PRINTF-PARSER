%{

#include<stdio.h>
int s=0,ln=0,p=0;
extern FILE *yyin;
int l=1,flag;

%}
 
%token PT STMT OBR CBR  ST WRI CT SC REA CSS QT ADA

%%

expr:   | expr lnst 
        | expr lnst1
	| expr lnst2

print: space PT space|PT | space PT | PT space	{ln=1;p=1;}

scanf: space SC space|SC | space SC | SC space	{ln=1;}

lnst1:	print obrc statement commaalpha cbrc ct

lnst2:  scanf obrc convser ammbeta cbrc ct

con: space CSS | CSS | CSS space | CSS con

lnst: 	print obrc statement cbrc ct

convser: quote con quote {ln=3;}

beta: ADA | ADA ammbeta

alpha : ADA |ADA comma
 
space: ST |ST space

semma: WRI REA beta

commaalpha: comma 	{ln=4;}

ct: space CT | CT	{ln=0;p=0;++l;}

comma: WRI alpha

statement: STMT 	{ln=3;}
 
ammbeta: semma		{ln=4;}

obrc: OBR 		{ln=2;}	

cbrc: CBR		{ln=5;}	

quote: QT

 
%%



int main(int argc, char *argv[])
{
	yyin=fopen(argv[1],"r");

	if(!yyin)
	{
		printf("\n\n\n\n\n\t\t\tThe File specified doesn't exist \n\n\n");
		exit(0);	
	}


	if(!yyparse())
	printf("\n\n\tTHE GIVEN STATEMENTS ARE VALID\t\t\t\n\n");


}

yyerror()
{


printf("\n\n\n\t Error occured at line no:%d \n\n\n\tType:",l);

if(p==1)
{
 	if(ln==0 )
		printf("Invalid identifier\n\n\n");
	else if( ln==1 )
		printf("Open Bracket missing\n\n\n");
	else if( ln==2 )
		printf("Statement incomplete\n\n\n");
	else if( ln==3 && flag==1)
		printf("Variables not mentioned\n\n\n");	
	else if( ln==3 && flag==0 || ln==4)
		printf("Closing bracket missing\n\n\n");	
	else if (ln==5)
		printf("Semi colon missing");
}
else
{
	if(ln==0 )
		printf("Invalid identifier\n\n\n");
	else if( ln==1 )
		printf("Open Bracket missing\n\n\n");
	else if( ln==2 && flag==0)
		printf("Invalid Conversion specification\n\n\n");
	else if( ln==2 || ln==3 )
		printf("Incomplete variable set\n\n\n");
	else if( ln==4 )
		printf("Closing bracket missing\n\n\n");	
	else if (ln==5)
		printf("Semi colon missing");
}
}


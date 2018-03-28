%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

%}


%token STR numb
  
         
%left   '*' '%' '&' '~' '@' '#' '=' '!'
%right  '?' '^'
%left   '(' ')'
%union {

char* strval;
int intval;
}

%start A
%type <strval>A
%type <strval>S

%type <strval>STR
%type <strval>numb

%%

A     :     S {$$=$1;printf("%s\n",$$);}
	;	
S     : STR {$$=$1;}
	

	|S '*' S {//printf("%s\n",$3);
			//printf("%s\n",$1);
		  //printf("%d\n",strlen($3));
		
		  char* s=malloc(sizeof(char)*(strlen($1)+strlen($3)+1));
                                strcpy(s,$1); strcat(s,$3);
                                $$=s;
			//printf("%s\n",$$);
			}


	| S '~' S { 
			int len=strlen($1);
			//printf("%d\n",len);
			 int i;
			char flag[]="true"; 
			char* s1=malloc(sizeof(char)*(strlen($1)));
			strcpy(s1,$1);
			char* s2=malloc(sizeof(char)*(strlen($3)));
			strcpy(s2,$3);		
			//printf("%s\n",flag);
			for(i=0;i<len;i++)
			{
				if(s1[i]!=s2[i])
				{
					//printf("%c  %c\n",s1[i],s2[i]);
					strcpy(flag,"false");
					break;
				}
			}
			$$=flag;
			//printf("%s\n",$$);
			 }
	| S '@' S  {
			int len1=strlen($1);
			int len2=strlen($3);
			int i,j;
			char flag[]="true"; 
			char* s1=malloc(sizeof(char)*(strlen($1)));
			strcpy(s1,$1);
			char* s2=malloc(sizeof(char)*(strlen($3)));
			strcpy(s2,$3);	
			for(i=len2-1,j=len1-1;j>=0;i--,j--)
			{
				if(s1[j]!=s2[i])
				{
					strcpy(flag,"false");
					break;
				}
			}
			$$=flag;
			//printf("%s\n",$$);
			}
	| S '#' S {
			int i,j,k,h,count=0;
			char temp[100];
			int len1=strlen($1);
			int len2=strlen($3);
			char flag[]="false";
			char* s1=malloc(sizeof(char)*(strlen($1)));
			strcpy(s1,$1);
			//printf("%s\n",s1);
			char* s2=malloc(sizeof(char)*(strlen($3)));
			strcpy(s2,$3);	
			//printf("%s\n",s2);
			for(i=0;s2[i]!='\0';i++)
			{	//printf("jk");
				for(j=i;s2[j]!='\0';j++)
				{
					for(k=i,h=0;k<=j;k++,h++)
					{
						temp[h]=s2[k];
					}
					temp[h]='\0';
					//printf("%s\n",temp);
					if(strcmp(temp,s1)==0)
					{
						strcpy(flag,"true");
						count=1;
						break;
					}			
				}
				if(count==1)
					break;
			}
			$$=flag;
			//printf("%s\n",$$);			
			}
	| S '=' S {
			char flag[]="false";
			char* s1=malloc(sizeof(char)*(strlen($1)));
			strcpy(s1,$1);
			char* s2=malloc(sizeof(char)*(strlen($3)));
			strcpy(s2,$3);
			if(strcmp(s1,s2)==0)
			{
			     strcpy(flag,"true");
			}
			$$=flag;
			//printf("%s\n",$$);
			}
	| S '!' S {
			char flag[]="true";
			char* s1=malloc(sizeof(char)*(strlen($1)));
			strcpy(s1,$1);
			char* s2=malloc(sizeof(char)*(strlen($3)));
			strcpy(s2,$3);
			if(strcmp(s1,s2)==0)
			{
			     strcpy(flag,"false");
			}
			$$=flag;
			//printf("%s\n",$$);
			}
	| S '^' S {
			int num=atoi($3);
			char* s=malloc(sizeof(char)*(strlen($1)*(num)));
			int i,n=num;
			strcpy(s,$1);
			//printf("%s\n",s);
			for(i=1;i<n;i++)
			{
				strcat(s,$1);
			}
			$$=s;
			//printf("%s\n",$$);
			}
	| S '%' S {
			int num=atoi($3);
			char* s=malloc(sizeof(char)*(num));
			char* s1=malloc(sizeof(char)*(strlen($1)));
			int i,n=num;
			strcpy(s1,$1);
			for(i=0;i<n;i++)
			{
				s[i]=s1[i];
			}
			$$=s;
			//printf("%s\n",$$);	
			}
	 | S '&' S {
			int num=atoi($3);
			char* s=malloc(sizeof(char)*(num));
			char* s1=malloc(sizeof(char)*(strlen($1)));
			int i,j,n=strlen($1),m=num;;
			strcpy(s1,$1);
			for(i=n-m,j=0;i<n;i++,j++)
			{
				s[j]=s1[i];
			}
			$$=s;
			//printf("%s\n",$$);
			}
	
	| '?' S {
			char* s1=malloc(sizeof(char)*(strlen($2)));
			int i,count=0;
			strcpy(s1,$2);
			
			char* s2=malloc(sizeof(char)*(strlen($2)));
			
			sprintf(s2,"%d",strlen($2));
			$$=s2;
			//printf("%s\n",$$);
			
		  }
	
	| '(' S ')'{
			$$=$2;
			
			}
	
	;


	


			

%%
main()
{

	printf("enter the expression\n");
	
	yyparse();
	
}    

yywrap(){}
yyerror()
{
	printf("error\n");
}

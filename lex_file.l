%{
#include<stdio.h>
#include<string.h>

#include "y.tab.h"

char op[2];

%}
id [<>]+

%%
[ ]+ {}
[*] {return '*';}
[@] {return '@';}
[~] {return '~';}
[#] {return '#';}
[=] {return '=';}
"^" {return '^';}
[%] {return '%';}
[&] {return '&';}
[?] {return '?';}
"<>" {return '!';}

[a-zA-Z]+  {yylval.strval=strdup(yytext); 
		return STR;}
[0-9]+  {yylval.intval=strdup(yytext); return STR;}
[\n] {return 0;}
. {return yytext[0];}




%%



%{
#include <stdio.h>
%}

%option noyywrap

%%
[ \t]+   { printf(" "); }

\n       { ECHO; }

.        { ECHO; }

%%

int main(void) {
    yylex();
    return 0;
}

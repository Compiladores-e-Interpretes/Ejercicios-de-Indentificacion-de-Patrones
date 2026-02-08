%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

static const char *skip_leading_ws(const char *s) {
    while (*s == ' ' || *s == '\t') {
        s++;
    }
    return s;
}
%}

%option noyywrap

%%

^[A-Z][[:alnum:]_]* {
    printf("Palabra reservada/importante: %s\n", yytext);
}

[ \t]+[A-Z][[:alnum:]_]* {
    const char *word = skip_leading_ws(yytext);
    printf("Palabra reservada/importante: %s\n", word);
}

\n    { /* ignorar */ }
.     { /* ignorar */ }

%%

int main(void) {
    yylex();
    return 0;
}

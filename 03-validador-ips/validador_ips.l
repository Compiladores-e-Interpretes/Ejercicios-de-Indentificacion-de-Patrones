%{
#include <stdio.h>
#include <string.h>

static int is_valid_ip4(const char *s) {
    int a, b, c, d;
    char tail;

    /* tail asegura que no haya basura extra después del patrón */
    if (sscanf(s, "%d.%d.%d.%d%c", &a, &b, &c, &d, &tail) != 4) {
        return 0;
    }

    return (a >= 0 && a < 256) && (b >= 0 && b < 256) && (c >= 0 && c < 256) && (d >= 0 && d < 256);
}
%}

%option noyywrap

DIG    [0-9]
OCT    {DIG}{1,3}
IPV4   {OCT}\.{OCT}\.{OCT}\.{OCT}

%%

{IPV4} {
    if (is_valid_ip4(yytext)) {
        printf("IP válida: %s\n", yytext);
    } else {
        printf("IP inválida: %s\n", yytext);
    }
}

\n    { /* ignorar */ }
.     { /* ignorar */ }

%%

int main(void) {
    yylex();
    return 0;
}

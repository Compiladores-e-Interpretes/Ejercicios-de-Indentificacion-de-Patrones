%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void print_markdown_link(const char *s) {
    const char *close_bracket = strchr(s, ']');
    const char *open_paren = close_bracket ? strchr(close_bracket, '(') : NULL;
    const char *close_paren = open_paren ? strchr(open_paren, ')') : NULL;

    if (!close_bracket || !open_paren || !close_paren) {
        return;
    }

    size_t text_len = (size_t)(close_bracket - (s + 1));
    size_t url_len = (size_t)(close_paren - (open_paren + 1));

    char *text = (char *)malloc(text_len + 1);
    char *url = (char *)malloc(url_len + 1);
    if (!text || !url) {
        free(text);
        free(url);
        return;
    }

    memcpy(text, s + 1, text_len);
    text[text_len] = '\0';

    memcpy(url, open_paren + 1, url_len);
    url[url_len] = '\0';

    printf("Enlace Markdown => texto: %s | url: %s\n", text, url);

    free(text);
    free(url);
}
%}

%option noyywrap

MDLINK   \[[^]\n]+\]\([^\)\n]+\)

%%

{MDLINK} {
    print_markdown_link(yytext);
}

\n    { /* ignorar */ }
.     { /* ignorar */ }

%%

int main(void) {
    yylex();
    return 0;
}

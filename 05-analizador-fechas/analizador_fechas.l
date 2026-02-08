%{
#include <stdio.h>
#include <string.h>

static int is_leap_year(int year) {
    return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
}

static int days_in_month(int month, int year) {
    switch (month) {
        case 1:  return 31;
        case 2:  return is_leap_year(year) ? 29 : 28;
        case 3:  return 31;
        case 4:  return 30;
        case 5:  return 31;
        case 6:  return 30;
        case 7:  return 31;
        case 8:  return 31;
        case 9:  return 30;
        case 10: return 31;
        case 11: return 30;
        case 12: return 31;
        default: return 0;
    }
}

static void analyze_date(const char *s) {
    int day, month, year;
    char tail;

    if (sscanf(s, "%d/%d/%d%c", &day, &month, &year, &tail) != 3) {
        return;
    }

    if (month < 1 || month > 12) {
        printf("Error: fecha imposible (mes fuera de rango): %s\n", s);
        return;
    }

    int dim = days_in_month(month, year);
    if (day < 1 || day > dim) {
        printf("Error: fecha imposible (día fuera de rango): %s\n", s);
        return;
    }

    printf("Fecha válida: %s\n", s);
}
%}

%option noyywrap

DAY    [0-3][0-9]
MONTH  [01][0-9]
YEAR   [0-9]{4}
DATE   {DAY}\/{MONTH}\/{YEAR}

%%

{DATE} {
    analyze_date(yytext);
}

\n    { /* ignorar */ }
.     { /* ignorar */ }

%%

int main(void) {
    yylex();
    return 0;
}

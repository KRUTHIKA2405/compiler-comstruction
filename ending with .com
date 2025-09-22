%{
#include <stdio.h>
%}

%%

.*\.com$      { printf("Matched line ending with .com: %s\n", yytext); }
.*            { /* Ignore other lines */ }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

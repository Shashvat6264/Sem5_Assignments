#include "y.tab.h"
#include <stdio.h>
extern int yyparse();

int main()
{
    yyparse();
    return 0;
}
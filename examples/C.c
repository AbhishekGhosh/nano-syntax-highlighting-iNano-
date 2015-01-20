#include <math.h>
#include <stdbool.h>

#define MACRO 350

/* Function declaration */
int main(void)
{
    // Boolean
    bool result = 2 > 1 ? true : false;

    // String literal
    char *somestring = "sadsdasd";

    // Function call
    int someinteger = floor(100 + MACRO);

    // Keywords
    if (1 > 2) {
        return 0;
    } else if (2 == 2) {
        goto finish;
    } else {
        return 2;
    }
finish:
    return 1;
}

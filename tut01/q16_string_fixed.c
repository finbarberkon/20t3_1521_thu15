#include <stdio.h>

/* How do we fix the code to avoid the issues in q15? */

int main(void) {
    char str[10];
    str[0] = 'H';
    str[1] = 'i';
    printf("%s", str);
    return 0;
}

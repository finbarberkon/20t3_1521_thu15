#include <stdio.h>

int main(void) {
    char str[10];
    str[0] = 'H';
    str[1] = 'i';

    /* Without this null terminator at the end, printf doesn't
     * know when to stop printing characters */
    str[2] = '\0';

    printf("%s\n", str);

    return 0;
}

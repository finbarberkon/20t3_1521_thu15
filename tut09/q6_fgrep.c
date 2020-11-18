// Print lines containing specified substring from the files specified as
// arguments

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_LINE 65536

void search_stream(FILE *stream, char *name, char *pattern);

int main(int argc, char *argv[]) {
    // If argc is less than 2, we don't have enugh arguments to work
    // If argc is two, we assume the user meant stdin
    // Otherwise, we loop through each of the files they specified
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <pattern> [files]\n", argv[0]);
    } else if (argc == 2) {
        char *pattern = argv[1];
        search_stream(stdin, "<stdin>", pattern);
    } else {
        for (int arg = 2; arg < argc; arg++) {
            char *pattern = argv[1];
            char *pathname = argv[arg];

            FILE *file = fopen(pathname, "r");
            if (file == NULL) {
                perror(pathname);
                exit(1);
            }

            search_stream(file, pathname, pattern);

            fclose(file);
        }
    }
    return 0;
}

void search_stream(FILE *stream, char *name, char *pattern) {
    // Get lines
    char buffer[MAX_LINE];
    int line_num = 1;

    while (fgets(buffer, MAX_LINE, stream) != NULL) {
        // Check if the string is in the file, and print it out
        if (strstr(buffer, pattern)) {
            printf("%s:%d:%s", name, line_num, buffer);
        }
        line_num++;
    }
}

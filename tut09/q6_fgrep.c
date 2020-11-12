// Print lines containing specified substring from the files specified as
// arguments

#include <stdio.h>
#include <string.h>

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
        for (int arg = 1; arg < argc; arg++) {
            char *pattern = argv[1];
            char *pathname = argv[arg];

            // Open a file
            // (check for errors)

            search_stream(file, pathname, pattern);
        }
    }
    return 0;
}

void search_stream(FILE *stream, char *name, char *pattern) {
    // Get lines

    // Check pattern is in the line and if so print

    // name:line_num:line

}

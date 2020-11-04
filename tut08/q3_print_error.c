#include <stdio.h>
#include <stdlib.h>

#include <err.h>        // For warn(), err()
#include <errno.h>      // For 'errno' value #defines like ENOENT
#include <error.h>      // For error()
#include <string.h>     // For strerror()

int main(void) {
    FILE *file;
    char *filename = "fileThatDoesntExist";

    // There are a LOT of ways to print out the error message you received.
    // Choose one you like, they all work on CSE.

    printf("Using strerror:\n");
    file = fopen(filename, "r");
    if (file == NULL) {
        char *err = strerror(errno);
        printf("%s\n", err);
    }

    // I like this one best because you probably already have stdio #included
    // and its easy to give it some info to print before the error message :)
    printf("Using perror:\n");
    file = fopen(filename, "r");
    if (file == NULL) {
        perror(filename);
    }

    printf("Using warn:\n");
    file = fopen(filename, "r");
    if (file == NULL) {
        warn(NULL);
    }

    printf("Using err:\n");
    file = fopen(filename, "r");
    if (file == NULL) {
        err(1, NULL);           // Will also exit with value 1
    }

    printf("Using error:\n");
    file = fopen(filename, "r");
    if (file == NULL) {
        error(1, errno, NULL);  // Will also exit with value 1
    }
}

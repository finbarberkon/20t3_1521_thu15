#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

void chmod_if_needed(char *pathname);

int main(int argc, char *argv[]) {
    // Loop through all command line arguments
    for (int i = 1; i < argc; i++) {
        chmod_if_needed(argv[i]);
    }
    return 0;
}

void chmod_if_needed(char *pathname) {
    // Create a struct stat and fill it with info abotu pathname
    // (and check for errors)

    // Extract mode and check whether it is globally writable

    // If it is globally writeable, chomd it
    // (and check for errors)
}

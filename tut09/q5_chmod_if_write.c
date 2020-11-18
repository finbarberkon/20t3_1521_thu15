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
    struct stat s;
    int err = stat(pathname, &s);
    if (err) {
        perror(pathname);
        exit(1);
    }

    // Extract mode and check whether it is globally writable
    mode_t mode = s.st_mode;

    // If it is globally writeable, chomd it
    // (and check for errors)
    if (mode & S_IWOTH) {
        printf("%s is writable, changing permissions\n", pathname);
        mode_t new_mode = mode ^ S_IWOTH;
        err = chmod(pathname, new_mode);
        if (err) {
            perror(pathname);
            exit(1);
        }
    } else {
        printf("%s is not writable\n", pathname);
    }
}

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // Check the number of arguments is correct, or print an error
    if (argc != 2) {
        fprintf(stderr, "Invalid number of arguments\n");
        return 1;
        // or exit(1);
    }

    char *filename = argv[1];

    // Open a file pointer to the file given via cmd line arg
    FILE *file = fopen(filename, "w+");

    // If there was an error opening the file, print the error
    if (file == NULL) {
        perror(filename);
        return 1;
        // or exit(1);
    }

    // Print the first line of that file to stdout
    int ch = fgetc(stdin);
    while (ch != '\n') {
        fputc(ch, file);

        ch = fgetc(stdin);
    }
    fputc('\n', file);

    // Close the file
    fclose(file);
    return 0;
}


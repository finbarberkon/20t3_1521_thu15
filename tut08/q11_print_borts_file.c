#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void print_borts_file(char *filename);
int get_bort(FILE *file);
void process_bort(int bort);

int main(int argc, char *argv[]) {
    // Print borts for any number of filename arguments
    for (int arg = 1; arg < argc; arg++) {
        print_borts_file(argv[arg]);
    }
    return 0;
}

void print_borts_file(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror(filename);
        exit(1);
    }

    int borts_read = 0;
    int bort = get_bort(file);
    while (bort != EOF) {
        printf("bort %4ld: %d\n", borts_read, bort);
        borts_read++;
        bort = get_bort(file);
    }

    fclose(file);
}

int get_bort(FILE *file) {
    int byte0 = fgetc(file);
    if (byte0 == EOF) {
        return EOF;
    }

    int byte1 = fgetc(file);
    if (byte1 == EOF) {
        return EOF;
    }

    return (byte0 << 8) | byte1;
}

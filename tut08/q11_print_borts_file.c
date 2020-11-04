#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void print_borts_file(char *filename);

int main(int argc, char *argv[]) {
    // Print borts for any number of filename arguments
    for (int arg = 1; arg < argc; arg++) {
        print_borts_file(argv[arg]);
    }
    return 0;
}

void print_borts_file(char *filename) {

}

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <assert.h>

void print_bits(uint32_t w) {
    int size = sizeof(uint32_t) * 8;
    for (int i = 0; i < size; i++) {
        uint32_t mask = 1u << (size - i - 1);
        if (w & mask) {
            printf("1");
        } else {
            printf("0");
        }
    }
    printf("\n");
}

uint32_t six_middle_bits(uint32_t num) {
    //uint32_t mask = 0b00000000000001111110000000000000;
    //num = num & mask;
    //return num;
    num = num >> 13;
    uint32_t mask = 0x3F; // 127;
    num = num & mask;
    return num;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        return 1;
    }

    uint32_t num = strtol(argv[1], NULL, 10);
    print_bits(num);
    uint32_t res = six_middle_bits(num);
    print_bits(res);
}

#include <stdio.h>
#include <assert.h>

typedef unsigned int Word;

Word reverseBits(Word w) {
    // Create a variable to hold the value we will return
    Word ret = 0;

    // sizeof returns the number of bytes in a type, so we times
    // by 8 to find out how many bits (8 bits in a byte)
    int size = sizeof(Word) * 8;

    for (int i = 0; i < size; i++) {
        // We use wMask as a cursor to inspect each bit in w
        Word wMask = 1u << (size - i - 1);
        // And we use rMask as a cursor to set each bit in ret
        Word rMask = 1u << i;

        // If w and wMask have the same bits set, then this will
        // be true, so we can then set the opposite bit in ret
        // to be true.
        if (w & wMask) {
            ret = ret | rMask;
        }
    }
    return ret;
}

void printBits(Word w) {
    int size = sizeof(Word) * 8;
    for (int i = 0; i < size; i++) {
        Word mask = 1u << (size - i - 1);
        if (w & mask) {
            printf("1");
        } else {
            printf("0");
        }
    }
}

// testing
int main(void) {
    Word w1 = 0x01234567;
    // 0000 => 0000 = 0
    // 0001 => 1000 = 8
    // 0010 => 0100 = 4
    // 0011 => 1100 = C
    // 0100 => 0010 = 2
    // 0101 => 1010 = A
    // 0110 => 0110 = 6
    // 0111 => 1110 = E

    // Print out the bits of each value
    printBits(w1);
    printf(" -> ");
    printBits(reverseBits(w1));
    printf("\n");

    // Check we got it right
    assert(reverseBits(w1) == 0xE6A2C480);
    puts("Test passed!\n");
    return 0;
}

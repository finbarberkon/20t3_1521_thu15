#include <stdio.h>

void print_elem(int nums[], int i);

int main(void)
{
    int nums[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    print_elem(nums, 0);

    return 0;
}

// We need a new function to call recursively
// Need to think about:
//   - base case
//   - advancing recursion (ie, no infinite recursion)
void print_elem(int nums[], int i) {
    /* First we check the base case:
     * if we get to the number of items in the list. In this case its similar
     * to the while condition in a loop */
    if (i == 10) {
        return;
    }

    /* Then we perform the action our function is written to perform */
    printf("%d\n", nums[i]);


    /* Then we call the function for the next element of the array */
    print_elem(nums, i + 1);
    return;
}

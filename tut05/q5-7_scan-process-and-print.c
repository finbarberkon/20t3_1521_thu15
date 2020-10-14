int main(void) {
    int i;
    int numbers[10] = {0};

    // Scan numbers into array
	i = 0;
    while (i < 10) {
        scanf("%d", &numbers[i]);
        i++;
    }

    // Add 42 to all negative numbers
    i = 0;
    while (i < 10) {
        if (numbers[i] < 0) {
            numbers[i] += 42;
        }
        i++;
    }

    // Print array
	i = 0;
    while (i < 10) {
        printf("%d\n", numbers[i]);
        i++;
    }
}

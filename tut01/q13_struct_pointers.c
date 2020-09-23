#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME_LENGTH 256
#define MAX_BREED_LENGTH 64

struct pet {
    char name[MAX_NAME_LENGTH];
    char breed[MAX_BREED_LENGTH];
    int age;
    int weight;
};

int main(int argc, char *argv[]) {
    struct pet my_pet;

    /* Ensure we have been given the correct amount of arguments */
    if (argc != 5) {
        printf("We need a name, breed, age and weight\n");
        return 1;
    }

    strcpy(my_pet.name, argv[1]);
    strcpy(my_pet.breed, argv[2]);
    my_pet.age = strtol(argv[3], NULL, 10);
    my_pet.weight = strtol(argv[4], NULL, 10);

    printf("%s is a %d year old %s that weighs %dg\n",
            my_pet.name, my_pet.age, my_pet.breed, my_pet.weight);

    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Person {
    char *name;
    int age;
};

int numbers_comparison(const void* a, const void* b) {
    return (*(double*)a > *(double*)b) - (*(double*)a < *(double*)b);
}

int names_comparison(const void* a, const void* b) {
    return strcmp(((struct Person*)a)->name, ((struct Person*)b)->name);
}

int person_comparison(const void* a, const void* b) {
    struct Person* person1 = (struct Person*)a;
    struct Person* person2 = (struct Person*)b;
    if (person1->age != person2->age) {
        return person2->age - person1->age;
    }
    return strcmp(person1->name, person2->name);
}

int main() {
    double numbers[12] = {
        645.41,
        37.59,
        76.41,
        5.31,
        -34.23,
        1.11,
        1.10,
        23.46,
        635.47,
        -876.32,
        467.83,
        62.25
    };

    struct Person people[17] = {
        {"Hal", 20},
        {"Susann", 31},
        {"Dwight", 19},
        {"Kassandra", 21},
        {"Lawrence", 25},
        {"Cindy", 22},
        {"Cory", 27},
        {"Mac", 19},
        {"Romana", 27},
        {"Doretha", 32},
        {"Danna", 20},
        {"Zara", 23},
        {"Rosalyn", 26},
        {"Risa", 24},
        {"Benny", 28},
        {"Juan", 33},
        {"Natalie", 25}
    };
    
    qsort(numbers, 12, sizeof(double), numbers_comparison);
    for (int i = 0; i < 12; ++i) {
        printf("%.2f, ", numbers[i]);
    }
    printf("\n\n");

    qsort(people, 17, sizeof(struct Person), names_comparison);
    for (int i = 0; i < 17; ++i) {
        printf("%s, %d; ", people[i].name, people[i].age);
    }
    printf("\n\n");

    qsort(people, 17, sizeof(struct Person), person_comparison);
    for (int i = 0; i < 17; ++i) {
        printf("%s, %d; ", people[i].name, people[i].age);
    }
    printf("\n\n");
}

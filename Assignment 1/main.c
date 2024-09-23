#include <stdlib.h>
#include <stdio.h>
#include "quick_sort.c"
#include "merge_sort.c"

int main()
{
    int a[] = {38, 27, 43, 3, 9, 82, 10};
    int n = sizeof(a) / sizeof(a[0]);

    // Testing quick sort
    int quickSortArray[] = {38, 27, 43, 3, 9, 82, 10};
    quick_sort(quickSortArray, n);
    printf("Quick Sorted array: ");
    for (int i = 0; i < n; i++)
    {
        printf("%d ", quickSortArray[i]);
    }
    printf("\n");

    // Testing merge sort
    int mergeSortArray[] = {38, 27, 43, 3, 9, 82, 10};
    merge_sort(mergeSortArray, n);
    printf("Merge Sorted array: ");
    for (int i = 0; i < n; i++)
    {
        printf("%d ", mergeSortArray[i]);
    }
    printf("\n");

    return 0;
}

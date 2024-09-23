#include <stdlib.h>
#include <stdio.h>

// Merge function to merge two halves of an array
void merge(int *a, int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;

    int *leftArray = (int *)malloc(n1 * sizeof(int));
    int *rightArray = (int *)malloc(n2 * sizeof(int));

    for (int i = 0; i < n1; i++)
        leftArray[i] = a[left + i];
    for (int i = 0; i < n2; i++)
        rightArray[i] = a[mid + 1 + i];

    int i = 0, j = 0, k = left;
    while (i < n1 && j < n2) {
        if (leftArray[i] <= rightArray[j]) {
            a[k++] = leftArray[i++];
        } else {
            a[k++] = rightArray[j++];
        }
    }

    while (i < n1) {
        a[k++] = leftArray[i++];
    }
    while (j < n2) {
        a[k++] = rightArray[j++];
    }

    free(leftArray);
    free(rightArray);
}

void merge_sort_recursive(int *a, int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;
        merge_sort_recursive(a, left, mid);
        merge_sort_recursive(a, mid + 1, right);
        merge(a, left, mid, right);
    }
}

void merge_sort(int *a, int n) {
    merge_sort_recursive(a, 0, n - 1);
}
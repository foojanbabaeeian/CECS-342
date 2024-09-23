#include <stdio.h>

void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

// Partition function for quick sort
int partition(int *a, int low, int high)
{
    int pivot = a[high]; // Choosing the last element as the pivot
    int i = low - 1;
    for (int j = low; j < high; j++)
    {
        if (a[j] <= pivot)
        {
            i++;
            swap(&a[i], &a[j]);
        }
    }
    swap(&a[i + 1], &a[high]);
    return i + 1;
}

// Quick sort function
void quick_sort_recursive(int *a, int low, int high)
{
    if (low < high)
    {
        int pi = partition(a, low, high);
        quick_sort_recursive(a, low, pi - 1);  // Recursively sort the left part
        quick_sort_recursive(a, pi + 1, high); // Recursively sort the right part
    }
}

void quick_sort(int *a, int n)
{
    quick_sort_recursive(a, 0, n - 1);
}

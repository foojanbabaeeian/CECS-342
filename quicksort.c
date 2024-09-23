#include <stdio.h>

void QuickSort(int *arr, int left, int right); // Function declaration
int Partition(int *arr, int left, int right);
void Swap(int *a, int *b);

int main(void)
{

    int arr[10] = {8, 11, 19, 2, 4, 6, 7, 10, 13, 16};

    QuickSort(arr, 0, 9);

    for (int i = 0; i < 10; i++)
    {
        printf("%d ", arr[i]);
    }

    return 0;
}

void QuickSort(int *arr, int left, int right)
{
    if (left < right)
    {
        int pivot = Partition(arr, left, right);
        QuickSort(arr, left, pivot - 1);  // Sort elements before partition
        QuickSort(arr, pivot + 1, right); // Sort elements after partition
    }
}

int Partition(int *arr, int left, int right)
{
    int pivot = arr[left]; // Choosing pivot as the leftmost element
    int low = left + 1;
    int high = right;

    while (low <= high)
    {
        // Find an element on the left that should be on the right
        while (low <= right && arr[low] <= pivot)
        {
            low++;
        }
        // Find an element on the right that should be on the left
        while (high >= left && arr[high] > pivot)
        {
            high--;
        }
        // Swap elements if needed
        if (low < high)
        {
            Swap(&arr[low], &arr[high]);
        }
    }

    // Swap the pivot element with arr[high] so that pivot sits at its correct position
    Swap(&arr[left], &arr[high]);

    return high; // Return the position of the pivot
}

void Swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

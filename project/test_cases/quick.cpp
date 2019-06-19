#include <bits/stdc++.h>
using namespace std;  

int partition (int arr[], int low, int high) 
{
    int temp;
    int pivot = arr[high];    // pivot 
    int i = (low - 1);  // Index of smaller element 
    int j = low;
    
    while ( j <= high- 1) 
    { 
        // If current element is smaller than or 
        // equal to pivot 
        if (arr[j] <= pivot) 
        {
            int temp;
            i++;    // increment index of smaller element
            
            temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
             
        } 
        j++;
    } 
    
    temp = arr[i+1];
    arr[i+1] = arr[high];
    arr[high] = temp;
    return (i + 1); 
} 
  

void quickSort(int arr[], int low, int high) 
{ 
    if (low < high) 
    { 
      
        int pi = partition(arr, low, high); 
  
        // Separately sort elements before 
        // partition and after partition 
        quickSort(arr, low, pi - 1); 
        quickSort(arr, pi + 1, high); 
    } 
} 
  
void printArray(int arr[], int size) 
{ 
    int i =0; 
    while( i < size)
    { 
        cout << arr[i] << " "; 
        i++;
    }
    cout << "\n";
} 
  
// Driver program to test above functions 
int main() 
{ 
    int arr[100]; 
    int n = 100; 
    int i =0;
    while (i < n)
    {
        arr[i] = 100 - i;
        i++;
    }
    cout << "Before sorting \n";
    printArray(arr , n);
    quickSort(arr, 0, n-1); 
    cout << "Sorted array: \n"; 
    printArray(arr, n); 
    return 0; 
} 

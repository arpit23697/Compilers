
# Semantic Analysis

1. type checking (test1.cpp)
2. Scoping (test2.cpp) 
3. Check for undeclared variables (test3.cpp) 
4. check for function type name and parameters (test4.cpp)  
5. Cannot call the function until it is declared  (test5.cpp)
6. Check if the function have the return statement (except in case of void) (test6.cpp)  
7. Check if correct function type is returned (test7.cpp)
8. Check if the program have the main function  (test8.cpp)
9. Check for uninitialised variables  (test9.cpp)

# Test Cases
##### 1. Quick.cpp
Basic c++ program for quick sort. The output file generated is out.js   
##### 2. fib.cpp
Takes the number n, print fibonacci numbers using recursion upto n, print the output  
Shows the use of recursion  

##### 3. test1.cpp 
This program will not compile successfully because of the use of variable outside the scope  
Gives error undeclared variable  

##### 4. test2.cpp 
This program will not compile successfully because the type of the variable used in the expression  
are not matching. Gives error left and right hand side not matching  

##### 5. test3.cpp
Check for incompatible declarations. Since the of declaration and value assigned is not matching so error   

##### 6. test4.cpp
Check for correct function call. If the function is called with wrong parameters then it will give error. This will also check the type of the calling parameters  

##### 7. test5.cpp
Cannot use undeclared functions. Gives error function is not declared

##### 8. test6.cpp
Check for the return type of the function.

##### 9. test7.cpp
Check if the return type of function is matching with the function return type.  

##### 10. test8.cpp 
Check if the program have the main function  
Without main function program will not compile  

##### 11. test9.cpp
Check if the variable is initialised. If not give the error

# Example (quicksort source and output file)
##### Source in c++
```c++
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

```

#### Target in javascript
```javascript
function partition ( arr  , low  , high  ){
	var temp;
	var pivot = arr[high];
	var i = ( low - 1 );
	var j = low;
	while ( j <= high - 1 )	{
		if (arr[j] <= pivot )
		{
			var temp;
			i++ ;
			temp = arr[i];
			arr[i] = arr[j];
			arr[j] = temp;
			}
		j++ ;
		}
	temp = arr[i + 1];
	arr[i + 1] = arr[high];
	arr[high] = temp;
	 return ( i + 1 );
	}
function quickSort ( arr  , low  , high  ){
	if (low < high )
	{
		var pi = partition (arr,low,high );
		quickSort (arr,low,pi - 1 );
		quickSort (arr,pi + 1,high );
		}
	}
function printArray ( arr  , size  ){
	var i = 0;
	while ( i < size )	{
		document.write( arr[i]," ");
		i++ ;
		}
	document.write( "<br>");
	}
function main (  ){
	var arr = new Array(100);
	var n = 100;
	var i = 0;
	while ( i < n )	{
		arr[i] = 100 - i;
		i++ ;
		}
	document.write( "Before sorting <br>");
	printArray (arr,n );
	quickSort (arr,0,n - 1 );
	document.write( "Sorted array: <br>");
	printArray (arr,n );
	 return 0;
	}
var s = main();
```

#include <bits/stdc++.h>
using namespace std;

int sum (int a[] , int n)
{
    int i =0;
    int total = 0;
    while (i < n)
    {
        total += a[i];
        i+=1;
    }
    return total;
}

int main ()
{
    int a[100];
    int i =0;
    int n = 100;

    n = 1;
    // cout << a ;
    while (i < n)
    {
        a[i] = i;
        i += 1;
    }
    cout <<"Sum is " <<sum(a,n);
    cout << " Feeling so good " ;
    return 0;
}
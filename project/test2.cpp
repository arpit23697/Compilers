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

    n[0] = 1;
    while (i < n)
    {
        a[i] = i;
        i += 1;
    }
    cout << sum(a,n);
    return 0;
}
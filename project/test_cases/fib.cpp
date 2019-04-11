#include <bits/stdc++.h>
using namespace std;

int Fibonacci(int n)
{
    if (n == 0)
        return 0;
    else if (n == 1)
        return 1;
    else
        return (Fibonacci(n - 1) + Fibonacci(n - 2));
}
int main()
{
    int n, i = 0, c;
    n = 30;
    cout << "Fibonacci series\n";

    c = 1;
    while(c <= n)
    {
        cout << Fibonacci(i) << " \n";
        i++;
        c++;
    }

    return 0;
}


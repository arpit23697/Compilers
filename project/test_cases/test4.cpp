#include <bits/stdc++.h>
using namespace std;

bool max (int a, int b)
{
    if (a > b) return true;
    else false;
}

int main ()
{
    int a= 0;
    int b = 100;
    bool c = true;
    string name = "arpit";

    c = max (a,b);              //This will work because called with correct parameters and return type is also matching
    c = max (a , name);         //Error because function is not called with correct type // invalid argument error
    name = max (a,b);           //Error because return type and name type is not going to match
    return 0;
}
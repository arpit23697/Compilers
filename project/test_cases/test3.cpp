#include <bits/stdc++.h>
using namespace std;

int main()
{
    int t = 0;
    bool check = "string";
    int a[100];
    string a = "arpit";
    t += check;         //gives error because left and right hand side not matching
    check = arpit;      //since left and right hand side not matching so error
    t += a[55] = check; //gives error because types are not matching (Gives error type not of array type)
    return 0;
}
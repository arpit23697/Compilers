#include <bits/stdc++.h>
using namespace std;

bool checkOdd(int a)
{
    bool ans;
    if (a % 2 == 0)
        ans = true;
    else
        ans = false;

    return ans; 
}

int notMain()            //Since main is not declared so at the end of the program gives error that no main function is declared
{
    int a = 0;
    int b = 100;
    bool c = true;
    string name = "arpit";

    return 0;
}

// Gives error  because no main function is declared
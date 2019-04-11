#include <bits/stdc++.h>
using namespace std;

int checkOdd (int a)
{
    bool ans;
    if (a % 2 == 0)
        ans = true;
    else 
        ans = false; 

    return ans;    //Since the return type of ans and the function return type is not matching
                    //So it will give the error
}


int main()
{
    int a = 0;
    int b = 100;
    bool c = true;
    string name = "arpit";

    c = max(a, b); //Since max function is not declared so this will give error
                   //Gives error no such function max
    return 0;
}
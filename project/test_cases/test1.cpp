#include <bits/stdc++.h>
using namespace std;

int main ()
{
    int i =0;
    int n = 100;
    while (i < n)
    {
        int temp = 0;
        if (i%2 == 0)
        {
            string output = "odd\n";
            cout << output;
        }
        else 
            cout << "even\n";    
        
        cout << output;                 //gives error because output is declared inside if 
    }
    temp = 100;                         //Temp is declared inside while
                                        //So because of scoping it is undeclared here
    return 0;
}
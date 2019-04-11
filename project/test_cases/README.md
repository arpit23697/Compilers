
#Semantic Analysis

1. type checking (test1.cpp)
2. Scoping (test2.cpp) 
3. Check for undeclared variables (test3.cpp) 
4. check for function type name and parameters (test4.cpp)  
5. Cannot call the function until it is declared  (test5.cpp)
6. Check if the function have the return statement (except in case of void) (test6.cpp)  
7. Check if correct function type is returned (test7.cpp)
8. Check if the program have the main function  (test8.cpp)
9. Check for uninitialised variables  (test9.cpp)

#Test Cases
#####1. Quick.cpp
Basic c++ program for quick sort. The output file generated is out.js   
#####2. fib.cpp
Takes the number n, print fibonacci numbers using recursion upto n, print the output  
Shows the use of recursion  

#####3. test1.cpp 
This program will not compile successfully because of the use of variable outside the scope  
Gives error undeclared variable  

#####4. test2.cpp 
This program will not compile successfully because the type of the variable used in the expression  
are not matching. Gives error left and right hand side not matching  

#####5. test3.cpp
Check for incompatible declarations. Since the of declaration and value assigned is not matching so error   

#####6. test4.cpp
Check for correct function call. If the function is called with wrong parameters then it will give error. This will also check the type of the calling parameters  

#####7. test5.cpp
Cannot use undeclared functions. Gives error function is not declared

#####8. test6.cpp
Check for the return type of the function.

#####9. test7.cpp
Check if the return type of function is matching with the function return type.  

#####10. test8.cpp 
Check if the program have the main function  
Without main function program will not compile  

#####11. test9.cpp
Check if the variable is initialised. If not give the error
#include <iostream>
#include <string>

using namespace std;

extern "C" {
     // declare assembly functions here to use
     // syntax: extern "C" [type] __stdcall [function(type1, type2)];
     bool __stdcall test1();
}

int main() {
     // use your function here
     string flag = test1() ? "TRUE" : "FALSE";
     cout << flag << endl;

     return 0;
}
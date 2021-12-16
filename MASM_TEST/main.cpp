#include <iostream>
#include <string>

using namespace std;

// syntax: extern "C" [type] __stdcall [function(type1, type2)];
extern "C" {
     bool isodd(int);
}

int main() {
     // use your function here

     string flag = isodd(3) ? "TRUE" : "FALSE";
     cout << flag << endl;

     return 0;
}
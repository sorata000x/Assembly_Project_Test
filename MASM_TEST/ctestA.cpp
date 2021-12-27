#include <iostream>
#include <string>
#include "ctestA.h"
#include "gtest/gtest.h"

using namespace std;

extern "C" {
     // declare assembly functions here to use
     // syntax: extern "C" [type] __stdcall [function(type1, type2)];
     int __stdcall a_test_BetterRandomRange(int, int);
     void _stdcall a_test_RandomString(int, char*);
     void _stdcall a_test_FiboGenerator(int, int*);
     void _stdcall a_test_FindMultiple(int, int, int*);
}

// =============== Chapter 5 ===================

// Helper Function
// Generate Fibonacci number (for Exercise 10)
int fib(int n) {
     if (n <= 1)
          return n;
     return fib(n - 1) + fib(n - 2);
}

// Exercise 5
bool c_test_BetterRandomRange(bool debug = false) {
     int lower = -10;
     int upper = 10;
     int result = upper+1;                                  // initialize with out of bound value
     for (int i = 0; i < 50; i++)                           // test for 50 times
     {
          result = a_test_BetterRandomRange(lower, upper);
          if (debug) { cout << result << endl; }
          if (result < lower || result >= upper)
          {
               if (debug) { cout << "FAILED: Out of bound." << endl; }
               return false;
          }
     }
   
     return true;
}

// Exercise 6
bool c_test_RandomString(bool debug = false) {
     const int size = 30;
     char arr[size+1];                                      // [size] number of characters + /0
     a_test_RandomString(size, arr);
     string str = arr;

     if (debug) { cout << arr << endl; }

     // Test string size
     if (str.size() != size) {
          if (debug) { cout << "FAILED: Expect string size " << size << " but receive " << str.size() << endl; }
          return false;
     }

     // Test if arr is null terminated
     if (arr[size] != NULL) {
          if (debug) { cout << "Expect string to be null terminated." << endl; }
          return false;
     }

     return true;
}

// Exercise 10
bool c_test_FiboGenerator(bool debug = false) {
     const int num = 10;
     int arr[num];
     a_test_FiboGenerator(num, arr);

     if (debug) { cout << "Generated Fibonacci numbers: "; }
     for (int i = 0; i < num; i++)
     {
          if (debug) { 
               cout << arr[i]; 
               if (i != num - 1)
                    cout << ", ";
               else
                    cout << "\n";
          }
          if (arr[i] != fib(i+1))
          {
               if (debug) {
                    cout << "FAILED: Expect " << i << " th Fibonacci number to be " << fib(i+1)
                         << " but received " << arr[i] << " instead." << endl;
               }
               return false;
          }
     }


     return true;
}

// Exercise 11
bool c_test_FindMultiple(bool debug = false) {

     const int K = 3;
     const int N = 50;
     int arr[N];
     // initialize arr with 0
     for (int i = 0; i < N; i++) {
          arr[i] = 0;
     }
     a_test_FindMultiple(K, N, arr);
     if (debug) {
          for (int i = 0; i < N; i++) {
               cout << arr[i];
               if (i != N - 1) { cout << ", "; }
          }
          cout << endl;
          // verify
          int exp = -1;                      // expect 1 or 0
          for (int i = 0; i < N; i++) {
               if (i % K == K-1) { exp = 1; }
               else { exp = 0; }
               if (arr[i] != exp)
               {
                    cout << "FAILED: Expect arr[" << i << "] to be " << exp << " but received " << arr[i] << "instead." << endl;
               }
          }
               
               
     }

     return true;
}


TEST(TEST_CHAPTER5, TestBetterRandomRange) {

     //EXPECT_EQ(0, <your individual test functions are called here>);

     EXPECT_EQ(1, c_test_BetterRandomRange(false));
}

TEST(TEST_CHAPTER5, TestRandomString) {

     //EXPECT_EQ(0, <your individual test functions are called here>);

     EXPECT_EQ(1, c_test_RandomString(false));
}

TEST(TEST_CHAPTER5, TestFiboGenerator) {

     //EXPECT_EQ(0, <your individual test functions are called here>);

     EXPECT_EQ(1, c_test_FiboGenerator(false));
}

TEST(TEST_CHAPTER5, TestFindMultiple) {

     //EXPECT_EQ(0, <your individual test functions are called here>);

     EXPECT_EQ(1, c_test_FindMultiple(false));
}



int main(int argc, char** argv) {
     ::testing::InitGoogleTest(&argc, argv);
     std::cout << "\n\n----------running testA.cpp---------\n\n" << std::endl;
     return RUN_ALL_TESTS();
}
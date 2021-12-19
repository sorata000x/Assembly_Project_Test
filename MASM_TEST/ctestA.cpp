#include <iostream>
#include <string>
#include "ctestA.h"
#include "gtest/gtest.h"

using namespace std;

extern "C" {
     // declare assembly functions here to use
     // syntax: extern "C" [type] __stdcall [function(type1, type2)];
     int __stdcall a_test_BetterRandomRange(int, int);
}

bool c_test_BetterRandomRange(bool debug = false) {
     
     int lower = -10;
     int upper = 10;
     int result = upper+1;                                  // initialize with out of bound value
     for (int i = 0; i < 50; i++)                           // test for 50 times
     {
          result = a_test_BetterRandomRange(lower, upper);
          if (debug == true) { cout << result << endl; }
          if (result < lower || result >= upper)
          {
               if (debug == true) { cout << "FAILED: Out of bound." << endl; }
               return false;
          }
     }
   
     return true;
}

TEST(TEST_CHAPTER5, TestBetterRandomRange) {

     //EXPECT_EQ(0, <your individual test functions are called here>);

     EXPECT_EQ(1, c_test_BetterRandomRange(true));
}


int main(int argc, char** argv) {
     ::testing::InitGoogleTest(&argc, argv);
     std::cout << "\n\n----------running testA.cpp---------\n\n" << std::endl;
     return RUN_ALL_TESTS();
}
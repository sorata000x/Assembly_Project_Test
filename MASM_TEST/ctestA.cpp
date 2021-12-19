#include <iostream>
#include <string>
#include "ctestA.h"
#include "gtest/gtest.h"

using namespace std;

extern "C" {
     // declare assembly functions here to use
     // syntax: extern "C" [type] __stdcall [function(type1, type2)];
     bool __stdcall test1();
}

bool ctest1(bool debug = false) {
     bool answer = true;
     bool result = test1();
     if (result != answer)
     {
          cout << "FAILED: Expected the result to be " << answer << "but recieved " << result << "instead." << endl;
          return false;
     }
     return true;
}

TEST(TEST_STUB, TestStub) {

     //EXPECT_EQ(0, <your individual test functions are called here>);

     EXPECT_EQ(1, ctest1(true));
}


int main(int argc, char** argv) {
     ::testing::InitGoogleTest(&argc, argv);
     std::cout << "\n\n----------running testB.cpp---------\n\n" << std::endl;
     return RUN_ALL_TESTS();
}
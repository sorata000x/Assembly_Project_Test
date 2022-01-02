#include <iostream>
#include "gtest/gtest.h"

using namespace std;

extern "C" {
     // declare assembly functions here to use
     // syntax: extern "C" [type] __stdcall [function(type1, type2)];
     bool __stdcall test_stub(bool);
     bool __stdcall test_IntCalc(bool);
}

bool c_test_stub(bool debug = false) {
     return test_stub(debug);
}

bool c_test_IntCalc(bool debug = false) {
     return test_IntCalc(debug);
}

TEST(TEST_STUB, TestStub) {

     //EXPECT_EQ(0, <your individual test functions are called here>);

     EXPECT_EQ(1, c_test_stub(false));
}

TEST(TEST_CHAPTER3, TestIntCalc) {

     EXPECT_EQ(1, c_test_IntCalc(false));
}

int main(int argc, char** argv) {
     ::testing::InitGoogleTest(&argc, argv);
     std::cout << "\n\n----------running testA.cpp---------\n\n" << std::endl;
     return RUN_ALL_TESTS();
}
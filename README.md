# Assembly Project Test
Program to test assembly projects in c++

# Prerequisite
**Google Test**

This project depends on google test.

Please download google test directly under `C:/` because the default include directory of google test in this project is `C:/googletest/googletest`.

Link to google test repository: https://github.com/google/googletest

To change the include directory please go to both `GoogleTest` and `MASM_TEST` project, go to `Properties`->`VC++ Directory`->`Include Directory` to change the directory of google test file. 

# How to Use
To use the program please open `MASM_TEST.sln`

**Note**

Please check if GoogleTest project is referenced in MASM_TEST project

How to add reference: 
 - Go to `File`->`Add`->`Existing Project`-> Open `GoogleTest.vcxproj`
 - Right under `Solution Explorer`, `MASM_TEST`, right click `Reference` -> `Add Reference` -> check `GoogleTest`

# Progress

**Update**
 - Added test for Chapter 5 Exercise 6.RandomString

**Issue**

**Working On**
 - Test the program with textbook projects
    - Write test for Chaper 5

**Future**

**Implemented**
 - Chapter 5 exercise test
    - Exercise 5.BetterRandomRange
    - Exercise 6.RandomString
 - Google Test
 - Call .asm function from another .asm file
 - Call a .asm (with original Irvine32.inc) function from .cpp

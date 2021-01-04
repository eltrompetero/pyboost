# ====================================================================================== #
# Script for compiling boost library that links multiple source files for use in Python
# module. Compare this with compile.sh which only handles a single source file that
# contains all the source code.
# ====================================================================================== #
#!/bin/bash
PYCONFIGDR=/home/eddie/anaconda3/envs/acled2

g++ -I$PYCONFIGDR/include/python3.8 -I$PYCONFIGDR/include \
    hello2.cpp \
    -c -fPIC -o hello2.o
g++ -I$PYCONFIGDR/include/python3.8 -I$PYCONFIGDR/include \
    -L$PYCONFIGDR/lib \
    -o hello2.so -fpic -shared hello2.o -lboost_python38 hello.hpp hello.cpp

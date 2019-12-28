#!/bin/bash
# Script for compiling boost library that links multiple source files for use in Python
# module. Compare this with compile.sh which only handles a single source file that
# contains all the source code.
PYCONFIGDR=/home/eddie/anaconda/envs/scotus4/include/python3.7m
PYTHONDR=/home/eddie/anaconda/envs/scotus4/bin

g++ -I$PYCONFIGDR hello2.cpp -c -fPIC -o hello2.o
g++ -I$PYCONFIGDR -o hello2.so -shared hello2.o -l:libboost_python-py35.so hello.hpp hello.cpp

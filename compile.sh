#!/bin/bash
# Script for compiling standalone, self-contained library for use in Python module.
# This example will work for hello1.cpp if invoked as `./compile.sh hello1`.
PYCONFIGDR=/home/eddie/anaconda/envs/scotus4/include/python3.7m
PYTHONDR=/home/eddie/anaconda/envs/scotus4/bin

g++ -I$PYCONFIGDR $1.cpp -fpic -c -o $1.o $2
g++ -I$PYCONFIGDR -o $1.so -shared $1.o -l:libboost_python-py35.so 

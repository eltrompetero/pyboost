# ====================================================================================== #
# Script for compiling standalone, self-contained library for use in Python module.
# This example will work for hello1.cpp if invoked as `./compile.sh hello1`.
# ====================================================================================== #
#!/bin/bash
PYCONFIGDR=/home/eddie/anaconda3/envs/acled2
PYTHONDR=/home/eddie/anaconda3/envs/acled2/bin

g++ -I$PYCONFIGDR/include/python3.8 -I$PYCONFIGDR/include \
    $1.cpp -fpic -c -o $1.o
g++ -I$PYCONFIGDR/include/python3.8 -I$PYCONFIGDR/include \
    -L$PYCONFIGDR/lib -o $1.so -shared $1.o -lboost_python38

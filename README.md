# Extending Python with C++ using Boost

These are some examples I've created to figure out how to extend Python with C++ using the
Boost library. Doc was all over the place and many referred to old libraries that were out
of date.

Examples for using Boost library with Python. Boost handles a lot of the boilerplate for
when we want to declare C++ modules that are usable by Python. If you want nitty-gritty go
to [https://docs.python.org/2/extending/extending.html].

A friend has also suggested numpy's C API, but I haven't taken a close look at that.


## Installation
Anaconda's "conda-forge" channel carries a compiled version of Boost.
```bash
$ conda install -c conda-forge boost==1.74.0
```


## Troubleshooting
Important to decide which version of Boost and which version of Python you are using and
the locations of the respective libraries and binaries. For the Anaconda install, you will
need to make sure the compiler is seeing the files in side your environment's path and the
folders "include", "include/python3.8", and "lib".

Conflicting versions will give you errors (like symbol errors). You can make sure that the
dynamic library you created is linking to the right libraries by using the command `ldd`.

Use `ldd` on the compiled "so", shared library. Make sure you are linking to a boost
shared python library that is the correct version. The default `-lboost_python` option
doesn't work for me because it will link to an outdated version of the library. For
example, you can see below that the boost library relies on Python 2.7, which will fail to
import properly when I call it in Python 3.
```
(scotus4) eddie@######:~/Dropbox/Research/fun/boost$ ldd boost.so                                                
        linux-vdso.so.1 (0x00007ffd9076f000)                                                                            
        libboost_python-py27.so.1.62.0 => /usr/lib/x86_64-linux-gnu/libboost_python-py27.so.1.62.0 (0x00007fc637b6e000) 
        libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007fc6377ec000)                                 
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007fc6374e8000)                                               
        libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007fc6372d1000)                                       
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fc636f32000)                                               
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fc636d2e000)                                             
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fc636b11000)                                   
        libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007fc63690e000)                                         
        librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007fc636706000)                                             
        /lib64/ld-linux-x86-64.so.2 (0x00007fc637fc1000)                                                                
```

Make sure that the name of the boost extension as defined the C++ file
(`BOOST_PYTHON_MODULE`) agrees with the library name.

Ignore references to b2 (and bjam, an old version of b2)! I was led down an unnecessary
road for simple extensions. I think these tools are more helpful for developers compiling
code for distribution. Not necessary for me, a scientist developing source for myself, to
use. All you need is g++.



## Examples
I've created a simple "hello, world" example that puts all source into a single C++ source
file. This is in "hello1.cpp". To compile this library,
```bash
$ ./compile.sh hello1
```

The second example shows how we can create a source header and cpp file and call them from
another "main" source file.
```bash
$ ./compile_linked.sh
```

Make sure everything compiled correctly by running
```bash
$ python test.py
```
This should print out
```
hello, world.
hello, world.
```


## Resources
[https://wiki.python.org/moin/boost.python/GettingStarted]

Again, I recommend ignoring stuff about bjam and to just compile using g++:
[https://www.boost.org/doc/libs/1_72_0/libs/python/doc/html/tutorial/index.html]

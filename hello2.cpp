#define BOOST_TEST_DYN_LINK
#include <stdio.h>
#include <iostream>
#include <boost/python/module.hpp>
#include <boost/python/def.hpp>
#include "hello.hpp"

BOOST_PYTHON_MODULE(hello2) {
    using namespace boost::python;
    def("greet", hello::greet);
}

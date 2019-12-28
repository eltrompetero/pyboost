#define BOOST_TEST_DYN_LINK
#include <boost/python/module.hpp>
#include <boost/python/def.hpp>

char const* greet() {
    return "hello, world.";
}

BOOST_PYTHON_MODULE(hello1) {
    using namespace boost::python;
    def("greet", greet);
}

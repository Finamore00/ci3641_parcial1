cmake_minimum_required(VERSION 3.27.0)

project(VectorLib)

set(CMAKE_CXX_STANDARD 11)

enable_testing()
add_library(VectorLib src/vector.cpp)
add_executable(test_runner test/test.cpp)

target_link_libraries(test_runner VectorLib)
add_test(NAME Test0 COMMAND test_runner)

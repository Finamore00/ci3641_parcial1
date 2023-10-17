// #include "catch.hpp"
#include "../src/vector.cpp"
#include <iostream>
#include <string>

using namespace std;
using namespace VectorLib;


/**
 * Testing suite para VectorLib
 * Author: Santiago Finamore
 * Carnet: 1810125
*/
int main(int argC, char* argV[]) {

    //Vectors to use
    Vector a = Vector(1.0, 2.0, 3.0);
    Vector b = Vector(4.0, 5.0, 6.0);

    //Testing vector addition
    if (a + b != Vector(5.0, 7.0, 9.0)) {
        return 1;
    }
    //Testing vector substraction
    if (a - b != Vector(-3.0, -3.0, -3.0)) {
        return 1;
    }
    if (b-a != Vector(3.0, 3.0, 3.0)) {
        return 1;
    }
    //Testing norms
    if (&a != sqrt(14)) {
        return 1;
    }
    if (&b != sqrt(77)) {
        return 1;
    }
    //Test vector product
    if (a*b != Vector(-3.0, 6.0, -3.0)) {
        return 1;
    }
    if (b*a != Vector(3.0, -6.0, 3.0)) {
        return 1;
    }
    //Test dot product
    if (a%b != 32.0) {
        return 1;
    }
    if (b%a != 32.0) {
        return 1;
    }
    //Test vector-scalar addition
    if (a + 5.0 != Vector(6.0, 7.0, 8.0)) {
        return 1;
    }
    //Test vector-scalar substraction
    if (b - 8.0 != Vector(-4.0, -3.0, -2.0)) {
        return 1;
    }
    //Test vector-scalar product
    if (a * 3 != Vector(3.0, 6.0, 9.0)) {
        return 1;
    }
    if (b * 0 != Vector(0, 0, 0)) {
        return 1;
    }
    //Test various combined operations
    if (a + b + (a*b) != Vector(2.0, 13.0, 6.0)) {
        return 1;
    }
    if (a*b - b*a != Vector(-6.0, 12.0, -6.0)) {
        return 1;
    }
    if (a*(b%a + 5) != Vector(37.0, 74.0, 111.0)) {
        return 1;
    }
    if (a* (b*b) != Vector(0.0, 0.0, 0.0)) {
        return 1;
    }

    return 0;
}
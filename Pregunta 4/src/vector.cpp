#include <iostream>
#include <ostream>
#include <string>
#include <sstream>
#include <cmath>

using namespace std;

namespace VectorLib {
    class Vector {
    public:
        double x;
        double y;
        double z;

        //Constructor para argumentos de tipo double
        Vector(double x, double y, double z) {
            this->x = x;
            this->y = y;
            this->z = z;
        }

        //Constructor para argumentos de tipo entero
        Vector(int x, int y, int z) {
            this->x = (double) x;
            this->y = (double) y;
            this->z = (double) z;
        }

        string toString() {
            stringstream s;
            s << "(" << x << ", " << y  << ", " << z << ")";
            return s.str();
        }

        //Operaciones Vector-Vector
        Vector operator+(Vector const& b) {
            Vector c(x + b.x, y + b.y, z + b.z);
            return c;
        }

        Vector operator-(Vector const& b) {
            Vector c(x - b.x, y - b.y, z - b.z);
            return c;
        }

        Vector operator*(Vector const& b) {
            double firstVal = this->y*b.z - this->z*b.y;
            double secondVal = this->z*b.x - this->x*b.z;
            double thirdVal = this->x*b.y - this->y*b.x;

            return Vector(firstVal, secondVal, thirdVal);
        }

        double operator%(Vector const& b) {
            return (this->x*b.x + this->y*b.y + this->z*b.z);
        }

        double operator&() {
            return sqrt(x*x + y*y + z*z);
        }

        bool operator==(Vector const& b) {
            return x == b.x && y == b.y && z == b.z;
        }

        bool operator!=(Vector const& b) {
            return x != b.x || y != b.y || z != b.z;
        }

        //Operaciones Vector-escalar
        Vector operator+(double const& n) {
            return Vector(x + n, y + n, z + n);
        }

        Vector operator+(int const& n) {
            double fp = (double) n;
            return Vector(x + fp, y + fp, z + fp);
        }

        Vector operator-(double const& n) {
            return Vector(x - n, y - n, z - n);
        }

        Vector operator-(int const& n) {
            double fp = (double) n;
            return Vector(x - fp, y - fp, z - fp);
        }

        Vector operator*(double const& n) {
            return Vector(x*n, y*n, z*n);
        }

        Vector operator*(int const& n) {
            double fp = (double) n;
            return Vector(x*fp, y*fp, z*fp);
        }
    };
}
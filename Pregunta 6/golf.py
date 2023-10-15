import sys
from math import *
from sympy import *
n = int(sys.argv[1])
print(fibonacci(floor(log2(((n+1)**2)*n*(n-1)/12))+1))
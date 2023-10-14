import sys
from math import *
from sympy import *
n = int(sys.argv[1])
print(fibonacci(floor(log2(comb(n+1,n-1)*comb(n+1,n-2)))+1))
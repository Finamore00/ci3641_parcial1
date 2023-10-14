import sys
from sympy import *
n = int(sys.argv[1])
print(fibonacci(floor(log(((binomial(n+1,n-1)*binomial(n+1,n-2))/n),2))+1))
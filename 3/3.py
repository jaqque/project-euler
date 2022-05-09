#!/usr/bin/env python

from math import sqrt

target = 123	
target = 600851475143 

primes=[target]

n=2
while n<sqrt(primes[-1]):
    i=primes[-1]
    if i % n == 0: 
        primes.insert(-1,n)
        primes.append(primes.pop()/n)
    else:
        n+=1


print(primes[-1])
print(primes)

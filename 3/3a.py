#!/usr/bin/env python

from math import sqrt

target = 600851475143
#target = 97
largest_factor=target

primes=[]
n=2 # 1 is not prime, so skip it.
while n < sqrt( largest_factor ):
    prime = True # assume prime until proven composite
    for p in primes:
        if (n % p) == 0: # get outta here!
            prime = False
            break # damn filthy composite
    if prime:
        # mm that's good prime
        # let's divide it away
        while largest_factor % n == 0 and largest_factor != n:
            largest_factor /= n
    n += 1

print (int(largest_factor))

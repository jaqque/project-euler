#!/usr/bin/env python

from math import sqrt

def prch(num, primes):
    s=int(sqrt(num))

    for prime in primes:
        if prime > s:
            break
        if (num % prime) == 0:
            return False
    return True

primes = [2, 3]
n = 1
while len(primes) < 10_001:
    for can in (6 * n - 1, 6 * n + 1):
        if prch(can, primes):
            primes.append(can)

    n += 1

print (primes[-1])

# ./7.py  0.10s user 0.02s system 91% cpu 0.132 total

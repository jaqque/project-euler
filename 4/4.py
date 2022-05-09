#!/usr/bin/env python

def is_palindromic(i):
    s = str(i)
    r = s[::-1]
    return s == r


largest = 0
high = 999
low = 100

for a in range(high, low, -1):
    if largest > a*a:
        break
    for b in range (a, low, -1):
        m=a * b
        if is_palindromic (m) and m > largest:
            largest = m

print (largest)

# python 4.py  0.06s user 0.02s system 88% cpu 0.084 total

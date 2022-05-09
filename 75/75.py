#!/usr/bin/env python

max = 1_500_000
triples=[[3,4,5]]

def new_triples(t):
# https://en.wikipedia.org/wiki/Pythagorean_triangle#Parent/child_relationships
    a=t[0]
    b=t[1]
    c=t[2]
    t1 = [  a - 2*b + 2*c,  2*a - b + 2*c,  2*a - 2*b + 3*c ]
    t2 = [  a + 2*b + 2*c,  2*a + b + 2*c,  2*a + 2*b + 3*c ]
    t3 = [ -a + 2*b + 2*c, -2*a + b + 2*c, -2*a + 2*b + 3*c ]

    return [ t1, t2, t3 ]

n=0
while n < len(triples):
    for t in new_triples(triples[n]):
        triples.append(t)
    n += 1
    while n<len(triples) and sum(triples[n]) > max:
        triples.pop(n)

# populate length array
l=[]
for i in range (0, max+1):
    l.append(0)

for t in triples:
    n=1
    while n * sum(t) <= max:
        l[n*sum(t)] += 1
        n += 1

a=0
for i in l:
    if i == 1:
        a += 1

print (a)

# Euler/75/75.py  3.55s user 0.04s system 98% cpu 3.649 total

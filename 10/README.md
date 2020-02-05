10
===

Sum of primes.

- rust: 2.875 total
- zsh: 8:19:04.05 total

Using a sieve:

- ruby: 0.469 total
- rust:

One _Billion_ Primes:
==

Using candidate * candidate as a lower bounds:

- ruby: 6:06.01 total
- rust: 1:34.13 total

`rustc -C link-args=-Wl,-stack_size\ -Wl,0x100000000 10a.rs`

Some optimizations curtesy of http://compoasso.free.fr/primelistweb/page/prime/eratosthene_en.php

The ones about bits, and skipping the twos I ignored. They are silly.

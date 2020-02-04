#!/usr/bin/env zsh

primes=(2 3) #start small; 3/2=1, causing a count down in line 7. oops.

for i in {3..20}; do
  is_prime=true
  for j in {2..$((i/2))}; do # sqrt approximation
    if (( i%j == 0 )); then
      is_prime=false
      # break
    fi
  done
  if [[ $is_prime = true ]]; then
    primes+=$i
  fi
done

for i in {2..20}; do # skipping one, multipicative identity. also has a stupid prime factorisation. eg: none
  n=$i
  for j in {1..$#primes}; do
    a[j]=0;
    until (( n%primes[j] !=0 )); do
      : $(( a[j]++ ))
      n=$(( n/primes[j] ))
    done
    if (( a[j] > m[j] )); then
      m[j]=$a[j]
    fi
  done
done

lcm=1
for i in {1..$#primes}; do
  for j in {1..$m[i]}; do
    : $(( lcm *= $primes[i] ))
  done
done

printf "%'d\n" $lcm

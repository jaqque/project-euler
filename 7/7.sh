#!/bin/bash

primes=()
count=0
i=2
until test $count -eq 10001; do
  prime=true
  for x in ${primes[@]}; do
    if [ $(( $i % $x )) -eq 0 ]; then
      prime=false
      break
    fi
  done
  if `$prime`; then
     primes=(${primes[@]} $i)
     count=$((count + 1 ))
     echo -n .
  fi
  i=$(( i + 1 ))
done
echo

echo $i
echo ${primes[10001]}

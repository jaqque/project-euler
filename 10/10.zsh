#!/usr/bin/env zsh

primes=(2 3) #start small; 3/2=1, causing a count down in line 7. oops.

integer sqrt
for i in {4..2000000}; do
  is_prime=true
  sqrt=$(( i**.5 ))
  for j in {1..$#primes}; do
    if (( i%primes[j] == 0 )); then
      is_prime=false
      break
    fi
    if (( $primes[j] > sqrt )); then
      break
    fi
  done
  if [[ $is_prime = true ]]; then
    primes+=$i
    : $(( sum += $i ))
    # echo -n .
  fi
done

echo
# echo $primes
printf "%'d\n" $#primes
printf "--> %'d\n" $sum

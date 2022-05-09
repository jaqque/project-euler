#!/bin/bash

is_palindrome() {
	s="$1"
	r="$(echo $s | rev )"
	test "$s" = "$r" && true || false
}

largest_palindrome=0
high=999
low=100

for a in $(seq $high $low); do
	echo -n .
	if test $largest_palindrome -gt $(( $a * $a )); then
		break
	fi
	for b in $(seq $high $low); do
		m=$(( a * b ))
		if is_palindrome $m && test $m -gt $largest_palindrome; then
			largest_palindrome=$m
		fi
	done
done

echo
echo $largest_palindrome

# bash ./4.sh  64.03s user 156.27s system 23% cpu 15:47.36 total

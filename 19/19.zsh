#!/bin/zsh
# vim: ts=2:sw=2

is_leap_year() {
  local year=$1
  (( year % 400 )) || return 0
  (( year % 100 )) || return 1
  (( year % 4 )) || return 0
  return 1
}

dom() {
  local month=$1
  local year=$2
  local days=( 31 28 31 30 31 30 31 31 30 31 30 31 )

  (( month==2 )) && is_leap_year $year && { echo 29; return }
  echo $days[$month]
}

for y in 1900 2000 2004 2001; do
  echo -n "year $y is "
  is_leap_year $y || echo -n "not "
  echo "a leap year."
done

d=1 # 1 Jan 1900 was a Monday. Given
for m in {1..12}; do
  d=$(( (d + $(dom $m 1900) ) % 7 ))
done

echo jan 1 1901 was $d
count=0

for y in {1901..2000} ; do
  for m in {1..12}; do
    c=.
    (( d )) || { c='!'; : $(( count++ )) }
    d=$(( (d + $(dom $m $y) ) % 7 ))
    echo -n $c 
  done
  echo -n \*
done  
echo

echo "months starting on sunday is $count"


exit
# * 1 Jan 1900 was a Monday.
# * Thirty days has September,
#   April, June and November.
#   All the rest have thirty-one,
#   Saving February alone,
#   Which has twenty-eight, rain or shine.
#   And on leap years, twenty-nine.
# * A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

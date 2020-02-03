#!/usr/bin/env zsh

zero="zero"
ones=("one" "two" "three" "four" "five" "six" "seven" "eight" "nine")
tens=("ten" "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety")
teens=("ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen")
typeset -A magnitude
magnitude=(100 "hundred" 1000 "thousand" 1000000 "million")

and='and' # set to and for british variant

for x in {1..1000}; do
number=''

if (( x == 0 )); then number="$zero"; else

# 0-99

if (( x%100 < 10)); then
  number="$ones[$(( x%100 ))]"
elif (( x%100 < 20 )); then
  number="$teens[$(( x%100-9 ))]"
else
  number="$tens[$(( x%100/10 ))]$ones[$(( x%10 ))]"
fi

# hundreds
if (( x/100%10 )); then
  number="${ones[ x/100%10 ]}$magnitude[100]${number:+$and$number}"
fi

# thousands
if (( x/1000%10 )); then
  number="${ones[ x/1000%10 ]}$magnitude[1000]$number"
fi

fi
# echo -n "$number "
: $(( count += $#number ))

done
printf "%'d\n" $count

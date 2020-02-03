#!/usr/bin/env ruby

ones = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
teens = ["ten", "eleven", "twelve", "thirteen", "fourteen",
  "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" ]
tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]


total=0

(1..1000).each do |x|

  british=''
  if ( x%100 < 10)
    british=ones[ x%100 ]
  elsif ( x%100 < 20 )
    british=teens[ x%100-10 ]
  else
    british=tens[ x%100/10] + ones[ x%10]
  end

  if ( x/100%10 > 0 )
    british=ones[ x/100%10 ] + "hundred" + (british.empty? ? "" : "and" + british)
  end

  # thousands
  if ( x/1000%10 > 0 )
    british=ones[ x/1000%10 ] + "thousand" + british
  end

  total += british.length
  # puts british

end

puts total

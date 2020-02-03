#!/usr/bin/env ruby

words = ["one thousand", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]  # index is dead on # except for 0, which is 1,000 -jaqque
tens = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"] # index is -1

total = 0
words.each {|word| total += word.gsub(/\s+/, '').length}

puts total

index = (words.length - 1)
zed = []
(21..999).to_a.each do |num|
  puts words.to_s
  if (num % 100).zero?
    hundred = words[num / 100]

    words.push("#{hundred} hundred")
    index += 1

    total += words[index].gsub(/\s+/, '').length
  elsif (num % 10).zero?
    if num > 100
      num_string = num.to_s.split('')
      hundred = words[num_string[0].to_i]
      ten = tens[(num_string[1].to_i - 1)]

      words.push("#{hundred} hundred and #{ten}")
      index += 1

      total += words[index].gsub(/\s+/, '').length
    else
      ten = (num / 10) - 1

      words.push(tens[ten])
      index += 1
      total += words[index].length
    end
  else
    #IF it's not a 10 / 100, then I have to create it
    word = [words[index], words[num.to_s.split('')[-1].to_i]] #because the hyphen doesn't count

    # zed.push(word)

    word.each {|wo| total += wo.gsub(/\s+/, '').length}
  end
end

puts total

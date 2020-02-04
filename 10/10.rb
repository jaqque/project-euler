#!/usr/bin/env ruby

max=2000000
sqrt_of_max=Math.sqrt(max).to_i
sum=0
number_of_primes=0
sieve=(1..max+1).to_a

# cross out 1, circle 2
sieve[1]=false
sieve[2]=true

(1..sqrt_of_max).each do |candidate|;
  next if(sieve[candidate]==false); # crossed out? skip it
  (2*candidate..max).step(candidate).each do |stepper|
    sieve[stepper]=false # cross out multiples of the candidiate
  end
end

(1..max).each do |prime|;
  if(sieve[prime]!=false)
    sum+=prime if(sieve[prime]!=false)
    number_of_primes+=1
  end
end

puts "The total of the #{number_of_primes} primes less than #{max} is #{sum}"

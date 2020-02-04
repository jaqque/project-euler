#!/usr/bin/env ruby


x=0
continue=true

while continue
  x += 1
  (1..20).each do |i|
    continue=false
    if ( x%i >0 ); then
      continue=true
      break
    end
  end
end

puts x

#!/bin/zsh

n=0 

for i in {1..999}; do 
  if [[ $(( ($i % 3) * ($i% 5) )) == 0 ]] && : $(( n+=i ))
done

echo $n 


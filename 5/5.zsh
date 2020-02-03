#!/usr/bin/env zsh

x=0
continue=true

while [[ $continue = "true" ]]; do
  : $(( x++ ))
  for i in {1..20}; do
    continue=false
    if (( x%i )); then
      continue=true
      break
    fi
  done
  if   ! (( x%100000 )); then echo "\n$(( x/100000 ))"
  elif ! (( x%10000  )); then echo    '#'
  elif ! (( x%1000   )); then echo -n '*'
  elif ! (( x%100    )); then echo -n '+'
  elif ! (( x%10     )); then echo -n '.'
  fi
done

echo
echo "ya boi $x"

#!/usr/bin/env zsh

status() {
  printf "\e[GI am on: %'d\n" $x
}
trap status INT

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
done

echo
printf "%'d\n" $x

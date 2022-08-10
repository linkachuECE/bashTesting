#!/bin/bash
realNumRegex="^\-?[0-9]+(\.[0-9]+)?$"

for x in $@; do
  if [[ !($x =~ $realNumRegex) ]]; then
    echo "All arguments must be real numbers"
    exit
  fi
done

largestNum=0

while [[ -n $1 ]]; do
  currNum=$1
  if (( $(echo "$currNum > $largestNum" | bc -l) )); then
    largestNum=$currNum
  fi
  shift
done

echo $largestNum
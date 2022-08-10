#!/bin/bash
fib () {
    returnString=""
    endValue=$1
    echo "Entered function with argument $endValue"

    i1=1
    i2=1

    while [[ $i2 -lt $endValue ]]; do
        #echo "i1: $i1, i2: $i2"
        returnString+="$i1. "
        temp=$i2
        i2=$(($i1+$i2))
        i1=$temp
        #echo "i1: $i1, i2: $i2"
    done

    echo ${returnString::-2}
}

echo "$(fib 1000)"
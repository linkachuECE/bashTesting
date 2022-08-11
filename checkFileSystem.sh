#!/bin/bash

output=$(df | grep "^$1")

if [[ -z $output ]]; then
    echo "Filesystem not found"
else
    echo "$output" | awk '{print "Filesystem " $1 " is " $5 " used with " $3 " KB free"}'
fi
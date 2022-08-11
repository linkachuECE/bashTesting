#!/bin/bash

if [[ $# -ne 3 || ! ($1 =~ [0-9]+) || ! ($2 =~ [0-9]+) ]]; then
    echo "Usage: printLines.sh startingLineNo numberOfLines filename"
    exit
fi

if [[ ! (-f $3) ]]; then
    echo "File not found"
    exit
fi

head --lines="$(($1 + $2 - 1))" "$3" | tail --lines="$2" 
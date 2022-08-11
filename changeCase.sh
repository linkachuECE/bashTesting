#!/bin/bash

if [[ ! ($# -eq 1) ]]; then
    echo "Usage: changeCase.sh fileName"
    exit
elif [[ ! (-f $1) ]]; then
    echo "$1: File not found"
    exit
fi

PS3="Please select an option: "
select option in "Lower to Upper" "Upper to Lower"; do

    if [[ "${option}" == "Lower to Upper" ]]; then
        cat "$1" | tr [:lower:] [:upper:]
    elif [[ "${option}" == "Upper to Lower" ]]; then
        cat "$1" | tr [:upper:] [:lower:]
    else
        echo "Not a valid option"
        continue
    fi

    break

done
echo
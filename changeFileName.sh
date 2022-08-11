#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: changeDirectoryName filename | directoryName"
    exit
elif [[ ! (-e $1) ]]; then
    echo "File/directory not found"
    exit
elif [[ -f $1 ]]; then
    oldFileName=$1
    newFileName=""
    for (( i=0; i<${#1}; i++ )); do
        if [[ ${oldFileName:$i:1} =~ [A-Z] ]]; then
            char=${oldFileName:$i:1}
            newFileName+=${char,,}
        elif [[ ${oldFileName:$i:1} =~ [a-z] ]]; then
            char=${oldFileName:$i:1}
            newFileName+=${char^^}
        else
            newFileName+=${oldFileName:$i:1};
        fi
    done
fi

mv "${oldFileName}" "${newFileName}"
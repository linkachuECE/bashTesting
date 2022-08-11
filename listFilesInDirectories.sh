#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Usage: listFilesInDirectories directory1 [directory2] ..."
fi

while [[ $# -gt 0 ]]; do
    if [[ -d $1 ]]; then
        echo "$1:"
        ls "$1"
    else
        echo "$1 is not a directory"
    fi
    echo
    shift
done
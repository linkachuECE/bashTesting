#!/bin/bash

if [[ $1 -ne 1 ]]; then
    echo "Usage: rename.sh prefix"
fi

for file in *; do
    newFileName="${1}${file}"
    mv "$file" "$newFileName"
done
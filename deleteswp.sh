#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: deleteswp.sh directory"
elif [[ ! (-d "$1") ]]; then
    echo "Directory not found"
else
    rm "${1}"/*.swp
fi
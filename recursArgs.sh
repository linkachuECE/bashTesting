#!/bin/bash

printArgs () {
    if [[ $# -gt 0 ]]; then
        echo $1
        shift
        printArgs "$@"
    fi
}

printArgs "$@"
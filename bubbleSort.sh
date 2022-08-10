#!/bin/bash

bubbleDescendSort () {
    arrayLen=${#array[@]}

    for (( i=0; i<$arrayLen; i++ )); do
        for (( j=$i+1; j<$arrayLen; j++ )); do
            if [[ ${array[i]} -lt ${array[j]} ]]; then
                temp=${array[i]}
                array[i]=${array[j]}
                array[j]=$temp
            fi
        done
    done
}

bubbleAscendSort () {
    arrayLen=${#array[@]}

    for (( i=0; i<$arrayLen; i++ )); do
        echo $i
        for (( j=$i+1; j<$arrayLen; j++ )); do
            if [[ ${array[i]} -gt ${array[j]} ]]; then
                temp=${array[i]}
                array[i]=${array[j]}
                array[j]=$temp
            fi
        done
    done
}

if [[ $# -eq 0 ]]; then echo "Please provide arguments"; fi

declare -a array=()

for x in $@; do
    if [[ !($x =~ [0-9]+) ]]; then
        echo "All arguments must be integers"
        exit
    else
        array+=($x);
    fi
done

PS3="Pick an ordering scheme: "
select option in Ascending Descending; do
    case $option in
        Ascending)
            bubbleAscendSort
            break
            ;;
        Descending)
            bubbleDescendSort
            break
            ;;
        *)
            echo "Not a valid option"
            exit
    esac
done

echo "${array[*]}"
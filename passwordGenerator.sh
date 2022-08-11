#!/bin/bash

declare -a chars=()
chars+=( $(for x in {a..z}; do echo $x; done) )
chars+=( $(for x in {A..Z}; do echo $x; done) )
chars+=( $(for x in "!" "@" "#" "\$" "%" "^" "&" "\*" "(" ")" "-" "_" "=" "+" "/" "?" "\." "<" ">" "," "'" "\"" ":" ";" "\\" "|" "}" "]" "{" "[" "~" "\`"; do echo $x; done) )
chars+=( $(for x in {0..9}; do echo $x; done) )

declare -a passwords=()

NUMPASSWORDS=8
charsLength=${#chars[@]}

for (( i=0; i<$NUMPASSWORDS; i++ )); do
    newPassword=""
    for (( j=0; j<8; j++ )); do
        index=$(( $RANDOM % $charsLength ))
        newPassword+=${chars[ $index ]}
    done

    if [[ ! ($newPassword =~ [a-z][A-Z][0-9]) ]]; then
        i=$(($i - 1))
        continue
    fi

    passwords+=("$newPassword")
done

echo "${passwords[@]}" | tr " " "\n"
while true; do
    echo -n "Enter string of single digit numbers followed by an operator: "
    read string
    if [[ !( $string =~ ([0-9]+)([\*\+\-]) ) ]]; then
        echo "Not a valid format"
    else
        break
    fi
done

runningTot=0

case "${BASH_REMATCH[2]}" in
    "*")
        runningTot=1
        ;;
    "+")
        runningTot=0
        ;;
    "-")
        runningTot=${BASH_REMATCH[1]:0:1}
        ;;
esac

numString=${BASH_REMATCH[1]}

for (( i=0; i<${#numString}; i++ )); do
    currNum=${numString:$i:1}
    case "${BASH_REMATCH[2]}" in
        "*")
            runningTot=$(echo $runningTot*$currNum | bc)
            ;;
        "+")
            runningTot=$(echo $runningTot+$currNum | bc)
            ;;
        "-")
            if [[ $i -eq 0 ]]; then continue; fi
            runningTot=$(echo $runningTot-$currNum | bc)
            ;;
    esac
done

echo "Final result: $runningTot"
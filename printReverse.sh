mainString=$1
finalString=""

if [[ $# -ne 1 ]]; then
    echo "Please provide one argument"
    exit
fi

for (( i = 0 ; i<${#mainString} ; i++ )); do
    finalString="${mainString:$i:1}${finalString}"
done

echo $finalString
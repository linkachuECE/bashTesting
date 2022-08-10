if [[ $# -ne 1 ]]; then
    echo "Provide one filename as the argument"
fi

if [[ -f "$1" ]]; then
    sed -ri '/^$/d' $1
else
    echo "File not found"
fi
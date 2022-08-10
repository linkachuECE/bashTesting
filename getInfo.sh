#!/bin/bash

declare -A listOfOptions=()
listOfOptions[hd]="Home directory"
listOfOptions[OS]="OS name and version"
listOfOptions[cwd]="Current working directory"
listOfOptions[shells]="Show all available shells in your system"
listOfOptions[hardDisk]="Hard disk information"
listOfOptions[CPU]="CPU information"
listOfOptions[mem]="Memory information"
listOfOptions[fileSys]="File system information"
listOfOptions[curRun]="Currently running process"
listOfOptions[exit]="Exit"

PS3="Enter an option: "

clear

while true; do
    select option in "${listOfOptions[@]}"; do

        case $option in
            "${listOfOptions[hd]}")
                eval echo ~$linkachu
                sleep 3
                ;;
            "${listOfOptions[OS]}")
                cat /etc/os-release | grep '^PRETTY_NAME=' | sed -e 's/^[^"]*"//' -e 's/"//'
                sleep 3
                ;;
            "${listOfOptions[cwd]}")
                pwd
                sleep 3
                ;;
            "${listOfOptions[shells]}")
                sed 's/.*\///' /etc/shells | sort -u
                sleep 3
                ;;
            "${listOfOptions[hardDisk]}")
                    lsblk | less
                ;;
            "${listOfOptions[CPU]}")
                    lscpu | less
                ;;
            "${listOfOptions[mem]}")
                    less < /proc/meminfo
                ;;
            "${listOfOptions[fileSys]}")
                    df | less
                ;;
            "${listOfOptions[curRun]}")
                    ps | less
                ;;
            "${listOfOptions[exit]}")
                break 3
                ;;
        esac

        clear
        break
    done
done

clear
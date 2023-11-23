#!/bin/bash

CFG_PATH="conf"
if [ $# -ge 1 ]; then
    if [ -f "$1" ]; then
        TARGET=$1
    else
        echo "${1} is not found..."
        exit
    fi
else
    echo "You need a connection configure shell script file as an argument, for example:"
    find "$CFG_PATH" -type f -name "*.sh" | while read -r file
    do
        script_name=$(basename "$0")
        echo -e "./$script_name \033[0;33m$file\033[0m"
    done
    exit
fi

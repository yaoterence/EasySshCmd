#!/bin/bash

if [ $# -ge 2 ]; then
    IO_TARGET=$2
else
    script_name=$(basename "$0")
    echo 'You need a 2nd argument for download/upload target, for example:'
    echo -e "./$script_name $1 \033[0;33mfile.txt\033[0m"
    exit
fi

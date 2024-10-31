#!/bin/bash
source src/args_checker.sh $1
source src/cmd_checker.sh

if [ -d "$MNT_DIR" ]; then
    umount -l $MNT_DIR
    ls $MNT_DIR
fi

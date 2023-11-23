#!/bin/bash
source src/args_checker.sh $1
source src/cmd_checker.sh

MNT_DIR=mnt/${REMOTE_ADDR}_${REMOTE_PORT}
if [ ! -d "$MNT_DIR" ]; then
    mkdir -p $MNT_DIR
fi
echo $PASS | sshfs -p $REMOTE_PORT -o password_stdin $SSH_ALGO_CMD $I_CMD $USER@$REMOTE_ADDR:$REMOTE_PATH $MNT_DIR
echo $MNT_DIR
ls -la $MNT_DIR

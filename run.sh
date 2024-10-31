#!/bin/bash
source src/args_checker.sh $1
source src/cmd_checker.sh

clear
$SSHPASS_CMD ssh $SSH_ALGO_CMD $I_CMD $USER@$REMOTE_ADDR -p $REMOTE_PORT -t "cd ${REMOTE_PATH}; bash --login"

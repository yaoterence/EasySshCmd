#!/bin/bash
source src/args_checker.sh $1
source src/cmd_checker.sh

ssh $SSH_ALGO_CMD $I_CMD $USER@$REMOTE_ADDR -p $REMOTE_PORT -t "exit; bash --login"
echo "initialize sshpass done..."

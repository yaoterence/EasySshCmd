#!/bin/bash
source src/args_checker.sh $1
source src/cmd_checker.sh
source src/io_checker.sh $1 $2

#################################################
$SSHPASS_CMD scp $SSH_ALGO_CMD -P $REMOTE_PORT $I_CMD $USER@$REMOTE_ADDR:$REMOTE_PATH/$IO_TARGET ./
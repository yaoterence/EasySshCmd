#!/bin/bash
source src/args_checker.sh $1
source src/cmd_checker.sh

if [[ -z "$DOCKER_CMD" ]] ; then
    DOCKER_CMD=docker
fi
if [ $# -ge 2 ]; then
    TARGET=$2
else
    echo "You need a docker image URL"
    exit
fi
BASE_NAME=`basename $2`
URLMD5=$(echo "$BASE_NAME" | sed 's/:/-/')
#URLMD5=`/bin/echo $2 | /usr/bin/md5sum | /bin/cut -f1 -d" "`
UPLOAD_FILE=$URLMD5.tar.gz
echo $UPLOAD_FILE

if [[ -f "$UPLOAD_FILE" ]]; then
    echo "$UPLOAD_FILE exists."
else
    docker pull $TARGET
    docker save $TARGET | gzip > $UPLOAD_FILE
    docker image rm $TARGET
fi

$SSHPASS_CMD scp $SSH_ALGO_CMD -P $REMOTE_PORT $I_CMD $UPLOAD_FILE $USER@$REMOTE_ADDR:$REMOTE_PATH
$SSHPASS_CMD ssh $SSH_ALGO_CMD $I_CMD $USER@$REMOTE_ADDR -p $REMOTE_PORT -t "cd ${REMOTE_PATH} && ${DOCKER_CMD} load -i ${UPLOAD_FILE} && rm ${UPLOAD_FILE} && exit; bash --login"

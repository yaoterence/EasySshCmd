#!/bin/bash
source src/args_checker.sh $1
source src/cmd_checker.sh
source src/io_checker.sh $1 $2

#################################################
UPLOAD_FILE=$IO_TARGET
TAR_GZ_FILE=""
if [[ -d "$IO_TARGET" ]]; then
	file=${UPLOAD_FILE##*/}
	parentdir="$(dirname "$UPLOAD_FILE")"
	UPLOAD_FILE=$file.tar.gz
	TAR_GZ_FILE=$UPLOAD_FILE
	tar zcvf $UPLOAD_FILE -C $parentdir $file
fi
$SSHPASS_CMD scp $SSH_ALGO_CMD -P $REMOTE_PORT $I_CMD $UPLOAD_FILE $USER@$REMOTE_ADDR:$REMOTE_PATH
if [[ ! -z "$TAR_GZ_FILE" ]] ; then
    rm $TAR_GZ_FILE
	$SSHPASS_CMD ssh $SSH_ALGO_CMD $I_CMD $USER@$REMOTE_ADDR -p $REMOTE_PORT -t "cd ${REMOTE_PATH} && tar zxvf ${TAR_GZ_FILE} && rm ${TAR_GZ_FILE}"
fi

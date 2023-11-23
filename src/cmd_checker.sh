#!/bin/bash

source $TARGET
if [[ -z "$ID_RSA" ]] ; then
    SSHPASS_CMD="sshpass -p ${PASS}"
    I_CMD=""
else
    SSHPASS_CMD="sshpass -p ${PASS} -P assphrase"
    I_CMD="-i ${ID_RSA}"
    chmod 600 $ID_RSA
fi
if [[ -z "$PASS" ]] ; then
    SSHPASS_CMD=""
fi
if [[ -z "$REMOTE_PORT" ]] ; then
    REMOTE_PORT=22
fi
if [[ ! -z "$SSH_ALGO" ]] ; then
    SSH_ALGO_CMD="-o HostKeyAlgorithms=+${SSH_ALGO} -o PubkeyAcceptedKeyTypes=+${SSH_ALGO}"
fi
MNT_DIR=mnt/${REMOTE_ADDR}_${REMOTE_PORT}

#!/usr/bin/env zsh

# @(#)ec2-scp.sh	0.1.0	06/25/2020
#
# Copyright (c) Penguin Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $

# Usage:
#       ec2-scp.sh <file-name> <ec2-public-dns-name>

if [ "$#" -ne 2 ]
then
        echo "Usage: $0 <file-name> <ec2-public-dns-name>"
        exit 1
fi

DEST_DIR=/home/ec2-user/uploads
DEST_HOST=${2}
KEY_FILE=/usr/local/keys/ec2-jonathan.pem
SOURCE_FILE=${1}
USER_ID=ec2-user

scp -i ${KEY_FILE} ${SOURCE_FILE} ${USER_ID}@${DEST_HOST}:${DEST_DIR}

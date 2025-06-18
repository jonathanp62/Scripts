#!/usr/bin/env zsh

# @(#)s3-remove.sh	0.1.0	08/06/2020
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
#       s3-remove.sh <file-name>

if [ "$#" -ne 1 ]
then
        echo "Usage: $0 <file-name>"
        exit 1
fi

BUCKET=9bc25a69caac3a-uploads
PROFILE=s3-read-write
SOURCE_FILE=${1}

aws s3 rm s3://${BUCKET}/${SOURCE_FILE} --profile ${PROFILE}

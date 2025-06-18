#!/usr/bin/env zsh

# @(#)s3-presign.sh	0.1.0	07/22/2020
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
#       s3-presign.sh <bucket-name> <key-name> [expires]
#
# Note: The default value for expires (in seconds) is 3600 (one hour).

if [ "$#" -ne 2 ] && [ "$#" -ne 3 ]
then
        echo "Usage: $0 <bucket-name> <key-name> [expires]"
        exit 1
fi

PROFILE=s3-read-only
BUCKET=${1}
KEY=${2}

if [ "$#" -eq 3 ]
then
	EXPIRES=${3}
else
	EXPIRES=
fi

if [ -z ${EXPIRES} ]
then
	aws s3 presign s3://${BUCKET}/${KEY} --profile ${PROFILE}
else
	aws s3 presign s3://${BUCKET}/${KEY} --expires-in ${EXPIRES} --profile ${PROFILE}
fi

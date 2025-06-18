#!/usr/bin/env zsh

# @(#)lambda-update.sh	0.1.0	07/30/2020
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
#       lambda-update.sh <function-name> <zip-file-name>

if [ "$#" -ne 2 ]
then
        echo "Usage: $0 <function-name> <zip-file-name>"
        exit 1
fi

FUNC_NAME=${1}
FILE_NAME=${2}

aws lambda update-function-code --function-name ${FUNC_NAME} --zip-file fileb://${FILE_NAME}

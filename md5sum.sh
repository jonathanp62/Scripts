#!/usr/bin/env zsh

# @(#)md5sum.sh	0.1.0	08/13/2019
#
# Copyright (c) Penguin Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2024-03-01 16:53:57 -0500 (Fri, 01 Mar 2024) $
# @revision     $LastChangedRevision: 14266 $

# Usage:
#       md5sum.sh -b <file-name>

if [ "$#" -ne 2 ]
then
        echo "Usage: $0 -b <file-name>"
        exit 1
fi

MD5=$(/sbin/md5 ${2} | awk '{print $4}')

echo "${MD5} *${2}"

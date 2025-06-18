#!/usr/bin/env zsh

# @(#)sha256sum.sh	0.1.0	08/13/2019
#
# Copyright (c) Penguin Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2024-03-24 07:31:19 -0400 (Sun, 24 Mar 2024) $
# @revision     $LastChangedRevision: 14267 $

# Usage:
#       sha256sum.sh -b <file-name>

if [ "$#" -ne 2 ]
then
        echo "Usage: $0 -b <file-name>"
        exit 1
fi

SHA256=$(/usr/bin/shasum -a 256 ${2} | awk '{print $1}')

echo "${SHA256} ${2}"

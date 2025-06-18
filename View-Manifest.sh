#!/usr/bin/env bash

# @(#)View-Manifest.sh	0.1.0	03/31/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2014-07-20 14:24:58 -0400 (Sun, 20 Jul 2014) $
# @revision     $LastChangedRevision: 1474 $

# Usage:
#       View-Manifest.sh <jar-name>

if [ "$#" -eq 0 ]
then
        echo "Usage: $0 <jar-name>"
        exit 1
fi

unzip -q -c ${1} META-INF/MANIFEST.MF

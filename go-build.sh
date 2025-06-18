#!/usr/bin/env zsh

# @(#)go-build.sh	0.1.2	03/03/2020
# @(#)go-build.sh	0.1.1	02/17/2020
# @(#)go-build.sh	0.1.0	03/23/2018
#
# Copyright (c) Penguin Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.2
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $

# Usage:
#   From the ./src directory of a Go project that contains a go module:
#       go-build.sh <output-file-name> <package-with-main>

if [ "$#" -eq 0 ] || [ "$#" -ne 2 ]
then
        echo "Usage: $0 <output-file-name> <package-with-main>"
        exit 1
fi

OUTPUT=${1}
PACKAGE=${2}

go build -v -o ../bin/${OUTPUT} ${PACKAGE}

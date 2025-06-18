#!/usr/bin/env bash

# @(#)renamer.sh	0.1.1	11/05/2020
# @(#)renamer.sh	0.1.0	09/02/2016
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2020-11-05 09:29:13 -0500 (Thu, 05 Nov 2020) $
# @revision     $LastChangedRevision: 13143 $
#
# Usage:
#       renamer.sh

# Handle file names with spaces in them

OIFS="$IFS"
IFS=$'\n'

INPUT_DIR=${HOME}/Temp/Source
OUTPUT_DIR=${HOME}/Temp/Target
BASE=Tiffany

FILES=`ls ${INPUT_DIR}`
COUNT=1

for FILE in ${FILES}
do
	cp "${INPUT_DIR}/${FILE}" ${OUTPUT_DIR}/${BASE}-${COUNT}.jpg

	COUNT=$[${COUNT} + 1]
done

# Restore the original IFS variable

IFS="$OIFS"

exit 0

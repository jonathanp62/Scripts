#!/usr/bin/env bash

# @(#)epub-cleanup.sh	0.1.0   08/05/2023
#
# Copyright (c) Jonathan M. Parker
# 324 Lantana Drive
# Owings Mills, MD 21117 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate$
# @revision     $LastChangedRevision$

# Usage:
#       epub-cleanup.sh

FILE_NAMES_FILE=${HOME}/Desktop/file-names.txt
EPUBS_FOLDER=${HOME}/epub/ePubs

if [ -f "${FILE_NAMES_FILE}" ]
then
	echo "File names file: ${FILE_NAMES_FILE}: OK"
else
	echo "File names file: ${FILE_NAMES_FILE}: Not OK"
fi

if cd ${EPUBS_FOLDER}
then
	echo "Changed to directory ${EPUBS_FOLDER} OK"
else
	echo "Failed to change to directory ${EPUBS_FOLDER} OK"
fi

IFS=$'\n' read -d '' -r -a FILE_NAMES < ${FILE_NAMES_FILE}

echo "Number of elements in ${FILE_NAMES_FILE}: ${#FILE_NAMES[@]}"

for FILE_NAME in ${FILE_NAMES[@]}
do
	if [ -f "${FILE_NAME}" ]
	then
		echo "File name: ${FILE_NAME}: OK"

		if rm ${FILE_NAME}
		then
			echo "Removed file ${FILE_NAME}: OK"
		else
			echo "Removed file ${FILE_NAME}: Not OK"
		fi
	else
		echo "File name: ${FILE_NAME}: Not OK"
	fi
done

#!/usr/bin/env bash

# @(#)epub-cleanup.sh	0.1.0   08/05/2023
#
# MIT License
#
# Copyright (c) 2026 Jonathan M. Parker
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
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

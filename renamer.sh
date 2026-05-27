#!/usr/bin/env bash

# @(#)renamer.sh	0.1.1	11/05/2020
# @(#)renamer.sh	0.1.0	09/02/2016
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

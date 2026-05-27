#!/usr/bin/env bash
#
# @(#)run_penny.sh	0.1.1	08/26/2015
# @(#)run_penny.sh	0.1.0	08/10/2015
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
# @updated      $LastChangedDate: 2015-09-01 12:15:29 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2989 $
#
# Usage:
#       run_penny.sh "Major/Minor" ["Major/Minor" "Major/Minor" ...]

if [ "${#}" -eq 0 ]
then
	echo "usage: ${0} "Major/Minor" ["Major/Minor" "Major/Minor" ...]"
	exit 1
fi
 
APPLICATION_HOME=/myhouse/src/penny

CONFIG_FILE=${HOME}/Config/run_penny.cfg
SCRIPT_NAME=${APPLICATION_HOME}/extract_ebook_penny.sh

echo "INFO: Using configuration file ${CONFIG_FILE}..."

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${DOCUMENTUM_PASSWORD}" ]
then
        echo "ERROR: Variable DOCUMENTUM_PASSWORD was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

while [ "${#}" -gt 0 ]
do
	${SCRIPT_NAME} ${DOCUMENTUM_PASSWORD} ${1}
	shift
done

exit 0

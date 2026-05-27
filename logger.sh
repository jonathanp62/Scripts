#!/usr/bin/env bash

# @(#)logger.sh   0.1.0   07/10/2014
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
# @updated      $LastChangedDate: 2014-07-10 12:00:46 -0400 (Thu, 10 Jul 2014) $
# @revision     $LastChangedRevision: 1458 $
#
# Execute any script and direct its standard out and error to a log file.
#
# Usage:
#       logger.sh <path-to-script> [optional-path-to-log-file]

if [ "$#" -eq 0 ] || [ "$#" -gt 2 ]
then
	echo "usage: ${0} <path-to-script> [optional-path-to-log-file]"
	exit 1
fi

SCRIPT=${1}

if [ "$#" -eq 2 ]
then
	LOG_FILE=${2}
else
	SCRIPT_BASE=`basename ${SCRIPT}`
	LOG_FILE=${SCRIPT_BASE%.*}-`date '+D20%y-%m-%dT%H-%M-%S.log'`
fi

echo "Executing script ${SCRIPT} and directing its standard out and error to ${LOG_FILE}..."
exec ${SCRIPT} 1>${LOG_FILE} 2>&1

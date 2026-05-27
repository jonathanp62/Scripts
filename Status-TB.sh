#!/usr/bin/env bash

# @(#)Status-TB.sh	0.1.2	09/01/2015
# @(#)Status-TB.sh	0.1.1	07/08/2014
# @(#)Status-TB.sh	0.1.0	06/18/2014
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
# @version      0.1.2
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $
#
# Usage:
#       Status-TB.sh
#
# Note: This script cannot detect is the TB WS server was started inside IntelliJ IDEA.

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

echo "INFO: Using colors file ${COLORS_FILE}..."

source ${COLORS_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source colors file ${COLORS_FILE}."
	exit 1
fi

PROCS=`ps -ef|grep "TASTEBOOK.SERVICE=ws"|grep -v grep|awk '{print $2}'`

if [ -z "${PROCS}" ]
then
	echo "INFO: TB is not running."
else
	for PROC in ${PROCS}
	do
		echo -e "${color_yellow}INFO: TB is running as process ${PROC}.${color_off}"
	done
fi

exit 0

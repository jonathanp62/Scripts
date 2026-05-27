#!/usr/bin/env bash

# @(#)Start-TomEE.sh	0.1.1	09/01/2015
# @(#)Start-TomEE.sh	0.1.0	08/16/2014
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
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $

# Usage:
#       Start-TomEE.sh [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        CONFIG_FILE=${HOME}/Config/TomEE.cfg
else
        CONFIG_FILE=${1}
fi

echo "INFO: Using configuration file ${CONFIG_FILE}..."
echo "INFO: Using colors file ${COLORS_FILE}..."

source ${COLORS_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source colors file ${COLORS_FILE}."
	exit 1
fi

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Unable to source configuration file ${CONFIG_FILE}.${color_off}"
	exit 1
fi

if [ -z "${tomee_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable tomee_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${tomee_pattern}" ]
then
        echo -e "${color_red_light}ERROR: Variable tomee_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

TOMEE_HOME=${tomee_home}
TOMEE_PATTERN=${tomee_pattern}

echo "INFO: Sourced TomEE home: ${TOMEE_HOME}"
echo "INFO: Sourced TomEE pattern: ${TOMEE_PATTERN}"

PROCS=`ps -ef|grep ${TOMEE_PATTERN}|grep -v grep|awk '{print $2}'`

if [ -z "${PROCS}" ]
then
	${TOMEE_HOME}/bin/startup.sh
	sleep 3

	PROCS=`ps -ef|grep ${TOMEE_PATTERN}|grep -v grep|awk '{print $2}'`

	if [ -z "${PROCS}" ]
	then
		echo -e "${color_red_light}ERROR: TomEE failed to be started.${color_off}"
		exit 1
	fi

	for PROC in ${PROCS}
	do
		echo "INFO: TomEE is now running as process ${PROC}."
	done
else
	for PROC in ${PROCS}
	do
		echo -e "${color_yellow}WARN: TomEE is already running as process ${PROC}.${color_off}"
	done
fi

exit 0

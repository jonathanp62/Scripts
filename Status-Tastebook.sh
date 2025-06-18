#!/usr/bin/env bash

# @(#)Status-Tastebook.sh	0.1.2	09/01/2015
# @(#)Status-Tastebook.sh	0.1.1	07/08/2014
# @(#)Status-Tastebook.sh	0.1.0	06/18/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.2
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $
#
# Usage:
#       Status-Tastebook.sh
#
# Note: This script cannot detect is the Tastebook WS server was started inside IntelliJ IDEA.

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
	echo "INFO: Tastebook is not running."
else
	for PROC in ${PROCS}
	do
		echo -e "${color_yellow}INFO: Tastebook is running as process ${PROC}.${color_off}"
	done
fi

exit 0

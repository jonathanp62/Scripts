#!/usr/bin/env bash

# @(#)Status-MySQL.sh	0.1.3	09/01/2015
# @(#)Status-MySQL.sh	0.1.2	07/08/2014
# @(#)Status-MySQL.sh	0.1.1	07/02/2014
# @(#)Status-MySQL.sh	0.1.0	06/18/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.3
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $
#
# Usage:
#       Status-MySQL.sh [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        CONFIG_FILE=${HOME}/Config/MySQL.cfg
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

if [ -z "${mysql_pattern}" ]
then
        echo -e "${color_red_light}ERROR: Variable mysql_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

MYSQL_PATTERN=${mysql_pattern}

echo "INFO: Sourced MySQL pattern: ${MYSQL_PATTERN}"

PROCS=`ps -ef|grep ${MYSQL_PATTERN}|grep -v grep|awk '{print $2}'`

if [ -z "${PROCS}" ]
then
	echo "INFO: MySQL is not running."
else
	for PROC in ${PROCS}
	do
		echo -e "${color_yellow}INFO: MySQL is running as process ${PROC}.${color_off}"
	done
fi

exit 0

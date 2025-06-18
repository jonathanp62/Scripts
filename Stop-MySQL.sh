#!/usr/bin/env bash

# @(#)Stop-MySQL.sh       0.1.4   09/01/2015
# @(#)Stop-MySQL.sh       0.1.3   09/12/2014
# @(#)Stop-MySQL.sh       0.1.2   07/08/2014
# @(#)Stop-MySQL.sh       0.1.1   07/02/2014
# @(#)Stop-MySQL.sh       0.1.0   06/18/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.4
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $

# Usage:
#       Stop-MySQL.sh [optional-configuration-file-path]

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

if [ -z "${mysql_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable mysql_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${mysql_pattern}" ]
then
        echo -e "${color_red_light}ERROR: Variable mysql_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

MYSQL_HOME=${mysql_home}
MYSQL_PATTERN=${mysql_pattern}

echo "INFO: Sourced MySQL home: ${MYSQL_HOME}"
echo "INFO: Sourced MySQL pattern: ${MYSQL_PATTERN}"

PROCS=`ps -ef|grep ${MYSQL_PATTERN}|grep -v grep|awk '{print $2}'`

if [ -z "${PROCS}" ]
then
	echo -e "${color_yellow}WARN: MySQL is not running.${color_off}"
else
	for PROC in ${PROCS}
	do
		echo "INFO: MySQL is running as process ${PROC}."
	done

	sudo ${MYSQL_HOME}/support-files/mysql.server stop
	sleep 3

	PROCS=`ps -ef|grep ${MYSQL_PATTERN}|grep -v grep|awk '{print $2}'`

	if [ -z "${PROCS}" ]
	then
		echo "INFO: MySQL is no longer running."
	else
		echo -e "${color_red_light}ERROR: MySQL failed to be stopped.${color_off}"
		exit 1
	fi
fi

exit 0

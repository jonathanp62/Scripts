#!/usr/bin/env bash

# @(#)Stop-TomEE.sh	0.1.1	09/01/2015
# @(#)Stop-TomEE.sh	0.1.0	08/16/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $

# Usage:
#       Stop-TomEE.sh [optional-configuration-file-path]

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
	echo -e "${color_yellow}WARN: TomEE is not running.${color_off}"
else
	for PROC in ${PROCS}
	do
		echo "INFO: TomEE is running as process ${PROC}."
	done

	${TOMEE_HOME}/bin/shutdown.sh
	sleep 5

	PROCS=`ps -ef|grep ${TOMEE_PATTERN}|grep -v grep|awk '{print $2}'`

	if [ -z "${PROCS}" ]
	then
		echo "INFO: TomEE is no longer running."
	else
		echo -e "${color_red_light}ERROR: TomEE failed to be stopped.${color_off}"
		exit 1
	fi
fi

exit 0

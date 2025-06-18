#!/usr/bin/env bash

# @(#)Stop-ActiveMQ.sh	0.1.2	09/01/2015
# @(#)Stop-ActiveMQ.sh	0.1.1	10/24/2014
# @(#)Stop-ActiveMQ.sh	0.1.0	10/22/2014
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

# Usage:
#       Stop-ActiveMq.sh [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        CONFIG_FILE=${HOME}/Config/ActiveMq.cfg
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

if [ -z "${activemq_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable activemq_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${activemq_pattern}" ]
then
        echo -e "${color_red_light}ERROR: Variable activemq_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

ACTIVEMQ_HOME=${activemq_home}
ACTIVEMQ_PATTERN=${activemq_pattern}

echo "INFO: Sourced ActiveMQ home: ${ACTIVEMQ_HOME}"
echo "INFO: Sourced ActiveMQ pattern: ${ACTIVEMQ_PATTERN}"

PROCS=`ps -ef|grep ${ACTIVEMQ_PATTERN}|grep -v grep|awk '{print $2}'`

if [ -z "${PROCS}" ]
then
	echo -e "${color_yellow}WARN: ActiveMQ is not running.${color_off}"
else
	for PROC in ${PROCS}
	do
		echo "INFO: ActiveMQ is running as process ${PROC}."
	done

	JBOSS_PROCS=`ps -ef|grep jboss|grep -v grep|awk '{print $2}'`

	if [ ! -z "${JBOSS_PROCS}" ]
	then
		echo -e "${color_red_light}ERROR: JBoss is still running.${color_off}"
		exit 1
	fi

	cd ${ACTIVEMQ_HOME}
	sudo bin/activemq stop
	sleep 5

	PROCS=`ps -ef|grep ${ACTIVEMQ_PATTERN}|grep -v grep|awk '{print $2}'`

	if [ -z "${PROCS}" ]
	then
		echo "INFO: ActiveMQ is no longer running."
	else
		echo -e "${color_red_light}ERROR: ActiveMQ failed to be stopped.${color_off}"
		exit 1
	fi
fi

exit 0

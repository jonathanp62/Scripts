#!/usr/bin/env zsh

# @(#)Status-Nexus.sh	0.1.1	09/01/2015
# @(#)Status-Nexus.sh	0.1.0	03/19/2015
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $
#
# Usage:
#       Status-Nexus.sh [optional-configuration-file-path]

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        CONFIG_FILE=${HOME}/Config/Nexus.cfg
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

if [ -z "${nexus_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable nexus_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${nexus_pattern}" ]
then
        echo -e "${color_red_light}ERROR: Variable nexus_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

NEXUS_HOME=${nexus_home}
NEXUS_PATTERN=${nexus_pattern}

echo "INFO: Sourced Nexus home: ${NEXUS_HOME}"
echo "INFO: Sourced Nexus pattern: ${NEXUS_PATTERN}"

if [ -f ${NEXUS_HOME}/bin/nexus ]
then
	${NEXUS_HOME}/bin/nexus status
fi

PROCS=$(ps -ef|grep ${NEXUS_PATTERN}|grep -v grep|awk '{print $2}')

if [ -z "${PROCS}" ]
then
	echo "INFO: Nexus is not running."
else
	for PROC in ${PROCS}
	do
		echo -e "${color_yellow}INFO: Nexus is running as process ${PROC}.${color_off}"
	done
fi

exit 0

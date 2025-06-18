#!/usr/bin/env zsh

# @(#)Start-Subversion.sh	0.1.8	01/18/2017
# @(#)Start-Subversion.sh	0.1.7	09/01/2015
# @(#)Start-Subversion.sh	0.1.6	07/30/2015
# @(#)Start-Subversion.sh	0.1.5	07/08/2014
# @(#)Start-Subversion.sh	0.1.4	04/04/2014
# @(#)Start-Subversion.sh	0.1.3	03/28/2014
# @(#)Start-Subversion.sh	0.1.2	03/24/2014
# @(#)Start-Subversion.sh	0.1.1	03/20/2014
# @(#)Start-Subversion.sh	0.1.0	03/16/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.8
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $

# Usage:
#       Start-Subversion.sh [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        CONFIG_FILE=${HOME}/Config/Subversion.cfg
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
	echo -e "ERROR: ${color_red_light}Unable to source configuration file ${CONFIG_FILE}.${color_off}"
	exit 1
fi

if [ -z "${svn_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable svn_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${svn_pattern}" ]
then
        echo -e "${color_red_light}ERROR: Variable svn_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

SVN_HOME=${svn_home}
SVN_PATTERN=${svn_pattern}

echo "INFO: Sourced Subversion home: ${SVN_HOME}"
echo "INFO: Sourced Subversion pattern: ${SVN_PATTERN}"

if env|grep -q ^SVN_REPOS=
then
	echo "INFO: SVN_REPOS: ${SVN_REPOS}"
else
	echo -e "${color_red_light}ERROR: SVN_REPOS is not exported${color_off}"
	exit 1
fi

UNAME=$(uname -n)

PROCESS=$(ps -ef|grep ${SVN_PATTERN}|grep -v grep|awk '{print $2}')

if [ -z "${PROCESS}" ]
then
	${SVN_HOME}/svnserve -d -r ${SVN_REPOS}

	if [ "$?" -ne 0 ]
	then
		echo -e "${color_red_light}ERROR: Failed to start Subversion as a daemon.${color_off}"
		exit 1
	fi

	sleep 1
	echo "INFO: Subversion is now running as process `ps -ef|grep ${SVN_PATTERN}|grep -v grep|awk '{print $2}'`."
else
	echo -e "${color_yellow}WARN: Subversion is already running as process ${PROCESS}.${color_off}"
fi

exit 0

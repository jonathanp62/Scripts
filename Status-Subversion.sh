#!/usr/bin/env zsh

# @(#)Status-Subversion.sh	0.1.4	09/01/2015
# @(#)Status-Subversion.sh	0.1.3	09/30/2014
# @(#)Status-Subversion.sh	0.1.2	07/08/2014
# @(#)Status-Subversion.sh	0.1.1	04/04/2014
# @(#)Status-Subversion.sh	0.1.0	03/16/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.4
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $
#
# Usage:
#       Status-Subversion.sh [optional-configuration-file-path]

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
	echo -e "${color_red_light}ERROR: Unable to source configuration file ${CONFIG_FILE}.${color_off}"
	exit 1
fi

if [ -z "${svn_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable svn_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${svn_pattern}" ]
then
        echo "ERROR: Variable svn_pattern was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${svn_pass}" ]
then
        echo -e "${color_red_light}ERROR: Variable svn_pass was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

SVN_HOME=${svn_home}
SVN_PATTERN=${svn_pattern}
SVN_PASS=${svn_pass}

echo "INFO: Sourced Subversion home: ${SVN_HOME}"
echo "INFO: Sourced Subversion pattern: ${SVN_PATTERN}"

PROCESS=$(ps -ef|grep ${SVN_PATTERN}|grep -v grep|awk '{print $2}')

if [ -z "${PROCESS}" ]
then
	echo "INFO: Subversion is not running locally."
else
	echo -e "${color_yellow}INFO: Subversion is running locally as process ${PROCESS}.${color_off}"
fi

if env|grep -q ^SVN_TARGET=
then
	echo "INFO: SVN_TARGET: ${SVN_TARGET}"
else
	echo -e "${color_red_light}ERROR: SVN_TARGET is not exported${color_off}"
	exit 1
fi

SVN_HOSTNAME=$(echo ${SVN_TARGET}|cut -c 7-)

echo "INFO: Pinging ${SVN_HOSTNAME}..."

/sbin/ping -t 2 ${SVN_HOSTNAME} > /dev/null 2>&1

if [ "$?" -ne 0 ]
then
	echo "INFO: Ping of ${SVN_HOSTNAME} failed."
	exit 1
else
	echo "INFO: Ping of ${SVN_HOSTNAME} completed OK."
fi

${SVN_HOME}/svn list ${SVN_TARGET} --password ${SVN_PASS} > /dev/null 2>&1

if [ "$?" -eq 0 ]
then
	echo -e "${color_yellow}INFO: The Subversion server at ${SVN_TARGET} is running.${color_off}"
else
	echo "INFO: The Subversion server at ${SVN_TARGET} is not running."
fi

exit 0

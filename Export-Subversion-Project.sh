#!/usr/bin/env bash

# @(#)Export-Subversion-Project.sh	0.1.1	08/26/2015
# @(#)Export-Subversion-Project.sh	0.1.0	03/28/2014
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
#       Export-Subversion-Project.sh <project-name> <destination>> [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        echo "Usage: ${0} <project-name> <destination> [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -gt 3 ]
then
        echo "Usage: ${0} <project-name> <destination> [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -eq 3 ]
then
	CONFIG_FILE=${3}
else
	CONFIG_FILE=${HOME}/Config/Subversion.cfg
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

SVN_HOME=${svn_home}

if env|grep -q ^SVN_TARGET=
then
	echo "INFO: SVN_TARGET: ${SVN_TARGET}"
else
	echo -e "${color_red_light}ERROR: SVN_TARGET is not exported.${color_off}"
	exit 1
fi

PROJECT=${1}
DESTINATION=${2}

echo "INFO: Exporting project ${PROJECT} to ${DESTINATION}..."

${SVN_HOME}/svn export ${SVN_TARGET}/${PROJECT} ${DESTINATION}

if [ "$?" -eq 0 ]
then
	echo "INFO: Done exporting project ${PROJECT} into ${DESTINATION}."
else
	echo -e "${color_red_light}ERROR: Failed to export project ${PROJECT}.${color_off}"
	exit 1
fi

exit 0

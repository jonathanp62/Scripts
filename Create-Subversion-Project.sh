#!/usr/bin/env zsh

# @(#)Create-Subversion-Project.sh	0.1.2	08/26/2015
# @(#)Create-Subversion-Project.sh	0.1.1	03/28/2014
# @(#)Create-Subversion-Project.sh	0.1.0	03/16/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.2
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $

# Usage:
#       Create-Subversion-Project.sh <project-name>> [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        echo "Usage: ${0} <project-name> [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -gt 2 ]
then
        echo "Usage: ${0} <project-name> [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -eq 2 ]
then
	CONFIG_FILE={2}
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

echo "INFO: Creating the ${PROJECT} project directory structure..."
${SVN_HOME}/svn mkdir -m "Created the ${PROJECT} project directory" ${SVN_TARGET}/${PROJECT}

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Failed to create the ${PROJECT} directory.${color_off}"
	exit 1
fi

echo "INFO: Creating the ${PROJECT} project trunk directory..."
${SVN_HOME}/svn mkdir -m "Created the ${PROJECT} project trunk directory" ${SVN_TARGET}/${PROJECT}/trunk

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Failed to create the ${PROJECT} trunk directory.${color_off}"
	exit 1
fi

echo "INFO: Creating the ${PROJECT} project branches directory..."
${SVN_HOME}/svn mkdir -m "Created the ${PROJECT} project branches directory" ${SVN_TARGET}/${PROJECT}/branches

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Failed to create the ${PROJECT} branches directory.${color_off}"
	exit 1
fi

echo "INFO: Creating the ${PROJECT} project tags directory..."
${SVN_HOME}/svn mkdir -m "Created the ${PROJECT} project tags directory" ${SVN_TARGET}/${PROJECT}/tags

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Failed to create the ${PROJECT} tags directory.${color_off}"
	exit 1
fi

echo "INFO: Done creating the ${PROJECT} project directory structure in Subversion."

exit 0

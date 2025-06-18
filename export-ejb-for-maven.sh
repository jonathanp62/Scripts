#!/usr/bin/env bash

# @(#)export-ejb-for-maven.sh	0.1.3	09/01/2015
# @(#)export-ejb-for-maven.sh	0.1.2	08/26/2015
# @(#)export-ejb-for-maven.sh	0.1.1	10/01/2014
#
# Copyright (c) Penguin Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.1
# @version      0.1.3
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $

# Usage:
#       export-ejb-for-maven.sh <project-name> [optional-configuration-file-path]

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
	CONFIG_FILE=${2}
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

if [ -z "${svn_pass}" ]
then
        echo -e "${color_red_light}ERROR: Variable svn_pass was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

SVN_PASS=${svn_pass}

if env|grep -q ^SVN_TARGET=
then
	echo "INFO: SVN_TARGET: ${SVN_TARGET}"
else
	echo -e "${color_red_light}ERROR: SVN_TARGET is not exported.${color_off}"
	exit 1
fi

PROJECT=${1}
PROJECTS_ROOT=${HOME}/NetBeans-Projects
SVN_PROJECTS_ROOT=${SVN_TARGET}/NetBeans
APPLICATION_BASE=src/main

cd ${PROJECTS_ROOT}/${PROJECT}/${PROJECT}-ejb/maven

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Failed to change into directory ${PROJECTS_ROOT}/${PROJECT}/${PROJECT}-ejb/maven.${color_off}"
	exit 1
fi

echo "INFO: Exporting the Java sources of ${PROJECT} to ${APPLICATION_BASE}..."

mvn scm:export -DconnectionUrl=scm:svn:${SVN_PROJECTS_ROOT}/${PROJECT}/trunk/${PROJECT}-ejb/src -DexportDirectory=${APPLICATION_BASE} -Dpassword=${SVN_PASS}

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Failed to export the Java sources.${color_off}"
	exit 1
fi

mkdir -p ${APPLICATION_BASE}/resources

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Failed to create directory ${APPLICATION_BASE}/resources.${color_off}"
	exit 1
fi

exit 0

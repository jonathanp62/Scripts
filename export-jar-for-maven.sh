#!/usr/bin/env bash

# @(#)export-jar-for-maven.sh	0.1.4	09/01/2015
# @(#)export-jar-for-maven.sh	0.1.3	08/26/2015
# @(#)export-jar-for-maven.sh	0.1.2	03/04/2015
# @(#)export-jar-for-maven.sh	0.1.1	10/01/2014
#
# MIT License
#
# Copyright (c) 2026 Jonathan M. Parker
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# @author       Jonathan Parker
# @since        0.1.1
# @version      0.1.4
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $

# Usage:
#       export-jar-for-maven.sh <project-name> [optional-configuration-file-path]

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
APPLICATION_MAIN=src/main/java
APPLICATION_TEST=src/test/java

cd ${PROJECTS_ROOT}/${PROJECT}/maven

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Failed to change into directory ${PROJECTS_ROOT}/${PROJECT}/maven.${color_off}"
	exit 1
fi

echo "INFO: Exporting the Java main sources of ${PROJECT} to ${APPLICATION_MAIN}..."

mvn scm:export -DconnectionUrl=scm:svn:${SVN_PROJECTS_ROOT}/${PROJECT}/trunk/src -DexportDirectory=${APPLICATION_MAIN} -Dpassword=${SVN_PASS}

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Failed to export the Java main sources.${color_off}"
	exit 1
fi

echo "INFO: Exporting the Java test sources of ${PROJECT} to ${APPLICATION_TEST}..."

mvn scm:export -DconnectionUrl=scm:svn:${SVN_PROJECTS_ROOT}/${PROJECT}/trunk/test -DexportDirectory=${APPLICATION_TEST} -Dpassword=${SVN_PASS}

if [ "$?" -ne 0 ]
then
	echo -e "${color_yellow}WARNING: Failed to export the Java test sources.${color_off}"
fi

exit 0

#!/usr/bin/env zsh

# @(#)Branch-Subversion-Project.sh	0.1.2	08/26/2015
# @(#)Branch-Subversion-Project.sh	0.1.1	03/28/2014
# @(#)Branch-Subversion-Project.sh	0.1.0	03/16/2014
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
# @since        0.1.0
# @version      0.1.2
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $

# Usage:
#       Branch-Subversion-Project.sh <project-name> <version>> [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        echo "Usage: ${0} <project-name> <version> [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -gt 3 ]
then
        echo "Usage: ${0} <project-name> <version> [optional-configuration-file-path]"
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
	echo -e "${color_red_light}ERROR: SVN_TARGET is not exported. ${color_off}"
	exit 1
fi

PROJECT=${1}
VERSION=${2}

echo "INFO: Creating the branch for version ${VERSION} of project ${PROJECT} ..."

${SVN_HOME}/svn copy ${SVN_TARGET}/${PROJECT}/trunk ${SVN_TARGET}/${PROJECT}/branches/${VERSION} -m "Created a branch of ${PROJECT} for version ${VERSION}"

if [ "$?" -eq 0 ]
then
	echo "INFO: Done creating the branch for version ${VERSION} of project ${PROJECT} in Subversion."
else
	echo -e "${color_red_light}ERROR: Failed to create the branch for version ${VERSION} of project ${PROJECT}.${color_off}"
	exit 1
fi

exit 0

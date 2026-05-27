#!/usr/bin/env bash

# @(#)Backup-Subversion.sh	0.1.4	08/26/2015
# @(#)Backup-Subversion.sh	0.1.3	07/09/2014
# @(#)Backup-Subversion.sh	0.1.2	07/03/2014
# @(#)Backup-Subversion.sh	0.1.1	04/04/2014
# @(#)Backup-Subversion.sh	0.1.0	03/28/2014
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
# @version      0.1.4
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $

# Usage:
#       Backup-Subversion.sh [optional-configuration-file-path]

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
        echo -e "${color_red_light}ERROR: Variable svn_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

SVN_HOME=${svn_home}
SVN_PATTERN=${svn_pattern}

echo "INFO: Sourced Subversion home: ${SVN_HOME}"
echo "INFO: Sourced Subversion pattern: ${SVN_PATTERN}"

# Check for the presence of SVN environment variables

if env|grep -q ^SVN_BACKUP=
then
	echo "INFO: SVN_BACKUP: ${SVN_BACKUP}"
else
	echo -e "${color_red_light}ERROR: SVN_BACKUP is not exported.${color_off}"
	exit 1
fi

if env|grep -q ^SVN_REPOS=
then
	echo "INFO: SVN_REPOS: ${SVN_REPOS}"
else
	echo -e "${color_red_light}ERROR: SVN_REPOS is not exported.${color_off}"
	exit 1
fi

if env|grep -q ^SVN_TARGET=
then
	echo "INFO: SVN_TARGET: ${SVN_TARGET}"
else
	echo -e "${color_red_light}ERROR: SVN_TARGET is not exported.${color_off}"
	exit 1
fi

# Check to see if the Subversion server is running locally and exit if so

PROCESS=`ps -ef|grep ${SVN_PATTERN}|grep -v grep|awk '{print $2}'`

if [ -z "${PROCESS}" ]
then
	echo "INFO: Subversion is not running locally."
else
	echo -e "${color_yellow}WARN: Subversion is running locally as process ${PROCESS}.${color_off}"
	exit 1
fi

# Check to see if there is connectivity to the Subversion server and exit if so

SVN_HOSTNAME=`echo ${SVN_TARGET}|cut -c 7-`

echo "INFO: Pinging ${SVN_HOSTNAME}..."

/sbin/ping -t 2 ${SVN_HOSTNAME} > /dev/null 2>&1

if [ "$?" -ne 0 ]
then
	echo "INFO: Ping of ${SVN_HOSTNAME} failed."
else
	echo "INFO: Ping of ${SVN_HOSTNAME} completed OK."

	${SVN_HOME}/svn list ${SVN_TARGET} > /dev/null 2>&1

	if [ "$?" -eq 0 ]
	then
		echo -e "${color_yellow}WARN: The Subversion server at ${SVN_TARGET} is running.${color_off}"
		exit 1
	fi
fi

# Make sure the backup file system is mounted

if [ -d "${SVN_BACKUP}" ]
then
	echo "INFO: Backup file system ${SVN_BACKUP} is mounted."
else
	echo -e "${color_red_light}ERROR: Backup file system ${SVN_BACKUP} is not mounted.${color_off}"
	exit 1
fi

# Create the backup folder

BACKUP_FOLDER=`date '+20%y-%m-%d'`

cd "${SVN_BACKUP}"

if [ ! -d "${BACKUP_FOLDER}" ]
then
	mkdir ${BACKUP_FOLDER}

	if [ "$?" -eq 0 ]
	then
		echo "INFO: Created new folder ${BACKUP_FOLDER}."
	else
		echo -e "${color_red_light}ERROR: Failed to create new folder ${BACKUP_FOLDER}.${color_off}"
		exit 1
	fi
else
	echo -e "${color_yellow}WARN: Backup folder ${BACKUP_FOLDER} already exists.${color_off}"
	exit 1
fi

# Invoke the backup

${SVN_HOME}/svnadmin hotcopy ${SVN_REPOS} "${SVN_BACKUP}/${BACKUP_FOLDER}"

if [ "$?" -eq 0 ]
then
	echo "INFO: Done backing up the Subversion repository at ${SVN_REPOS} into ${SVN_BACKUP}/${BACKUP_FOLDER}."
else
	echo -e "${color_red_light}ERROR: Failed to backup the Subversion repository at ${SVN_REPOS}.${color_off}"
	exit 1
fi

exit 0

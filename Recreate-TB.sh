#!/usr/bin/env bash

# @(#)Recreate-TB.sh    0.1.1   08/26/2015
# @(#)Recreate-TB.sh	0.1.0	01/16/2015
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
# @version      0.1.1
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $
#
# Usage:
#       Recreate-TB.sh [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
        export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        CONFIG_FILE=${HOME}/Config/MySQL.cfg
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

if [ -z "${mysql_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable mysql_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${mysql_pattern}" ]
then
        echo -e "${color_red_light}ERROR: Variable mysql_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${mysql_admin_user}" ]
then
        echo -e "${color_red_light}ERROR: Variable mysql_admin_user was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${mysql_admin_pass}" ]
then
        echo -e "${color_red_light}ERROR: Variable mysql_admin_pass was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

MYSQL_HOME=${mysql_home}
MYSQL_PATTERN=${mysql_pattern}
MYSQL_ADMIN_USER=${mysql_admin_user}
MYSQL_ADMIN_PASS=${mysql_admin_pass}

TB_CREATE_SQL=${HOME}/Dropbox/MyRH/Tastebook/PRHTB-Script.sql
TB_DB_NAME=prhtb

echo "INFO: Sourced MySQL home: ${MYSQL_HOME}"
echo "INFO: Sourced MySQL pattern: ${MYSQL_PATTERN}"
echo "INFO: Sourced MySQL admin user: ${MYSQL_ADMIN_USER}"

echo "INFO: Will connect to database: ${TB_DB_NAME}"
echo "INFO: Will use SQL file: ${TB_CREATE_SQL}"

PROCS=`ps -ef|grep ${MYSQL_PATTERN}|grep -v grep|awk '{print $2}'`

if [ -z "${PROCS}" ]
then
	echo -e "${color_red_light}ERROR: MySQL is not running.${color_off}"
	exit 1
else
	for PROC in ${PROCS}
	do
		echo "INFO: MySQL is running as process ${PROC}."
	done
fi

$MYSQL_HOME/bin/mysql ${TB_DB_NAME} -u ${MYSQL_ADMIN_USER} -p${MYSQL_ADMIN_PASS} < ${TB_CREATE_SQL}

if [ "$?" -eq 0 ]
then
	echo "INFO: Done recreating the ${TB_DB_NAME} database from ${TB_CREATE_SQL}."
else
	echo -e "${color_red_light}ERROR: Failed to recreate the ${TB_DB_NAME} database.${color_off}"
	exit 1
fi

exit 0

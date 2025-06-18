#!/usr/bin/env bash

# @(#)Backup-MySQL.sh	0.1.1	01/26/2015
# @(#)Backup-MySQL.sh	0.1.0	01/16/2015
#
# Copyright (c) Penguin Random House, Inc.
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
#       Backup-MySQL.sh [optional-configuration-file-path]

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

MYSQL_HOME=${mysql_home}
MYSQL_PATTERN=${mysql_pattern}

echo "INFO: Sourced MySQL home: ${MYSQL_HOME}"
echo "INFO: Sourced MySQL pattern: ${MYSQL_PATTERN}"

# Check for the presence of MYSQL environment variables

if env|grep -q ^MYSQL_BACKUP=
then
	echo "INFO: MYSQL_BACKUP: ${MYSQL_BACKUP}"
else
	echo -e "${color_red_light}ERROR: MYSQL_BACKUP is not exported.${color_off}"
	exit 1
fi

# Check to see if the MySQL server is running locally and exit if so

PROCESS=`ps -ef|grep ${MYSQL_PATTERN}|grep -v grep|awk '{print $2}'`

if [ -z "${PROCESS}" ]
then
	echo "INFO: MySQL is not running locally."
else
	for PROC in ${PROCESS}
	do
		echo -e "${color_yellow}INFO: MySQL is running as process ${PROC}.${color_off}"
	done

	exit 1
fi

# Make sure the backup file system is mounted

if [ -d "${MYSQL_BACKUP}" ]
then
	echo "INFO: Backup file system ${MYSQL_BACKUP} is mounted."
else
	echo -e "${color_red_light}ERROR: Backup file system ${MYSQL_BACKUP} is not mounted.${color_off}"
	exit 1
fi

# Create the backup folder

BACKUP_FOLDER=`date '+20%y-%m-%d'`

cd "${MYSQL_BACKUP}"

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

# Make the backup

cd $MYSQL_HOME

sudo tar -czvf "${MYSQL_BACKUP}/${BACKUP_FOLDER}/data.gz" data

if [ "$?" -eq 0 ]
then
	echo "INFO: Done backing up the MySQL database to ${MYSQL_BACKUP}/${BACKUP_FOLDER}."
else
	echo -e "${color_red_light}ERROR: Failed to backup the MySQL database.${color_off}"
	exit 1
fi

exit 0

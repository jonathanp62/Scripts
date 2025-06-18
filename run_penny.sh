#!/usr/bin/env bash
#
# @(#)run_penny.sh	0.1.1	08/26/2015
# @(#)run_penny.sh	0.1.0	08/10/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-09-01 12:15:29 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2989 $
#
# Usage:
#       run_penny.sh "Major/Minor" ["Major/Minor" "Major/Minor" ...]

if [ "${#}" -eq 0 ]
then
	echo "usage: ${0} "Major/Minor" ["Major/Minor" "Major/Minor" ...]"
	exit 1
fi
 
APPLICATION_HOME=/myhouse/src/penny

CONFIG_FILE=${HOME}/Config/run_penny.cfg
SCRIPT_NAME=${APPLICATION_HOME}/extract_ebook_penny.sh

echo "INFO: Using configuration file ${CONFIG_FILE}..."

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${DOCUMENTUM_PASSWORD}" ]
then
        echo "ERROR: Variable DOCUMENTUM_PASSWORD was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

while [ "${#}" -gt 0 ]
do
	${SCRIPT_NAME} ${DOCUMENTUM_PASSWORD} ${1}
	shift
done

exit 0

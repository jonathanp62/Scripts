#!/usr/bin/env bash

# @(#)Upload-Stickies.sh   0.1.1   09/01/2015
# @(#)Upload-Stickies.sh   0.1.0   06/26/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-09-01 12:15:29 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2989 $

# Usage:
#       Upload-Stickiess.sh [optional-configuration-file-path]

if [ "$#" -eq 0 ]
then
        CONFIG_FILE=${HOME}/Config/Stickies.cfg
else
        CONFIG_FILE=${1}
fi

echo "INFO: Using configuration file ${CONFIG_FILE}..."

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${local_database}" ]
then
        echo "ERROR: Variable local_database was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${cloud_database}" ]
then
        echo "ERROR: Variable cloud_database was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

LOCAL=${local_database}
CLOUD=${cloud_database}

echo "INFO: Sourced local database: ${LOCAL}"
echo "INFO: Sourced cloud database: ${CLOUD}"

echo "INFO: Uploading the Stickies database to the cloud..."
cp ${LOCAL} ${CLOUD}
echo "INFO: Done uploading."

exit 0

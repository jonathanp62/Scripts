#!/usr/bin/env bash

# @(#)Sync-MAMP-AGO.sh	0.1.2	09/01/2015
# @(#)Sync-MAMP-AGO.sh	0.1.1	07/07/2014
# @(#)Sync-MAMP-AGO.sh	0.1.0	03/31/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.2
# @updated      $LastChangedDate: 2015-09-01 11:52:17 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2988 $

# Usage:
#       Sync-MAMP-AGO.sh [optional-configuration-file-path]

if [ "$#" -eq 0 ]
then
        CONFIG_FILE=${HOME}/Config/Sync.cfg
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

if [ -z "${baltimore_ago_root}" ]
then
        echo "ERROR: Variable baltimore_ago_root was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${baltimore_ago_mamp}" ]
then
        echo "ERROR: Variable baltimore_ago_mamp was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

AGO_ROOT=${baltimore_ago_root}
AGO_MAMP=${baltimore_ago_mamp}

if [ -d "${AGO_MAMP}" ]
then
	rsync -av --delete --exclude=".svn" ${HOME}/${AGO_ROOT}/dev ${AGO_MAMP}
else
	echo "Directory ${AGO_MAMP} does not exist."
	exit 1
fi

exit 0

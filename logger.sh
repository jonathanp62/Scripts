#!/usr/bin/env bash

# @(#)logger.sh   0.1.0   07/10/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2014-07-10 12:00:46 -0400 (Thu, 10 Jul 2014) $
# @revision     $LastChangedRevision: 1458 $
#
# Execute any script and direct its standard out and error to a log file.
#
# Usage:
#       logger.sh <path-to-script> [optional-path-to-log-file]

if [ "$#" -eq 0 ] || [ "$#" -gt 2 ]
then
	echo "usage: ${0} <path-to-script> [optional-path-to-log-file]"
	exit 1
fi

SCRIPT=${1}

if [ "$#" -eq 2 ]
then
	LOG_FILE=${2}
else
	SCRIPT_BASE=`basename ${SCRIPT}`
	LOG_FILE=${SCRIPT_BASE%.*}-`date '+D20%y-%m-%dT%H-%M-%S.log'`
fi

echo "Executing script ${SCRIPT} and directing its standard out and error to ${LOG_FILE}..."
exec ${SCRIPT} 1>${LOG_FILE} 2>&1

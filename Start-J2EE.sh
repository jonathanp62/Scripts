#!/usr/bin/env bash

# @(#)Start-J2EE.sh	0.1.1	09/01/2015
# @(#)Start-J2EE.sh	0.1.0	01/02/2015
#
# Copyright (c) Penguin Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-09-01 11:52:17 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2988 $
#
# Usage:
#       Start-J2EE.sh [optional-configuration-file-path]

SCRIPT_HOME=${HOME}/Scripts
COLORS_FILE=${HOME}/Config/Colors.cfg

echo "INFO: Using colors file ${COLORS_FILE}..."

source ${COLORS_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source colors file ${COLORS_FILE}."
	exit 1
fi

${SCRIPT_HOME}/Start-MySQL.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_red_light}ERROR: MySQL did not start.${color_off}"
	exit 1
fi

${SCRIPT_HOME}/Start-ActiveMQ.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_red_light}ERROR: ActiveMQ did not start.${color_off}"
	exit 1
fi

${SCRIPT_HOME}/Start-JBoss.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_red_light}ERROR: JBoss did not start.${color_off}"
	exit 1
fi

exit 0

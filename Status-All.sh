#!/usr/bin/env zsh

# @(#)Status-All.sh	0.1.9	04/27/2025
# @(#)Status-All.sh	0.1.8	04/29/2024
# @(#)Status-All.sh	0.1.7	11/08/2023
# @(#)Status-All.sh	0.1.6	09/01/2015
# @(#)Status-All.sh	0.1.5	03/19/2015
# @(#)Status-All.sh	0.1.4	01/11/2015
# @(#)Status-All.sh	0.1.3	10/22/2014
# @(#)Status-All.sh	0.1.2	09/10/2014
# @(#)Status-All.sh	0.1.1	08/16/2014
# @(#)Status-All.sh	0.1.0	06/18/2014
#
# Copyright (c) Jonathan Martin Parker.
# 324 Lantana Drive
# Owings Mills, MD 21117 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.9
# @updated      $LastChangedDate: 2025-04-27 06:55:45 -0400 (Sun, 27 Apr 2025) $
# @revision     $LastChangedRevision: 14298 $
#
# Usage:
#       Status-All.sh [optional-configuration-file-path]

SCRIPT_HOME=${HOME}/Scripts
COLORS_FILE=${HOME}/Config/Colors.cfg

echo "INFO: Using colors file ${COLORS_FILE}..."

source ${COLORS_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source colors file ${COLORS_FILE}."
	exit 1
fi

${SCRIPT_HOME}/Status-Glassfish.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-Glassfish.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-MySQL.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-MySQL.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-Subversion.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-Subversion.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-Tastebook.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-Tastebook.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-TomEE.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-TomEE.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-JBoss.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-JBoss.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-ActiveMQ.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-ActiveMQ.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-MongoDB.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-MongoDB.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-Nexus.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-Nexus.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-Redis.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-Redis.sh did not complete normally.${color_off}"
fi

${SCRIPT_HOME}/Status-Jenkins.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_yellow}WARN: Status-Jenkins.sh did not complete normally.${color_off}"
fi

exit 0

#!/usr/bin/env bash

# @(#)Redploy-Glassfish.sh      0.1.6   08/26/2015
# @(#)Redploy-Glassfish.sh	0.1.5	10/08/2014
# @(#)Redploy.sh		0.1.4	07/09/2014
# @(#)Redploy.sh		0.1.3	07/07/2014
# @(#)Redploy.sh		0.1.2	06/26/2014
# @(#)Redploy.sh		0.1.1	03/31/2014
# @(#)Redploy.sh		0.1.0	03/13/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.6
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $

# Usage:
#	Redploy-Glassfish.sh <application-name> <application-version> <application-file> [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
        export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]
then
	echo "Usage: $0 <application-name> <application-version> <application-file> [optional-configuration-file-path]"
	exit 1
fi

if [ "$#" -eq 4 ]
then
        CONFIG_FILE=${4}
else
        CONFIG_FILE=${HOME}/Config/Glassfish.cfg
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

if [ -z "${glassfish_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable glassfish_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${glassfish_pattern}" ]
then
        echo -e "${color_red_light}ERROR: Variable glassfish_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${glassfish_pass}" ]
then
        echo -e "${color_red_light}ERROR: Variable glassfish_pass was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${glassfish_user}" ]
then
        echo -e "${color_red_light}ERROR: Variable glassfish_user was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

GF_HOME=${glassfish_home}
GF_PATTERN=${glassfish_pattern}
GF_PASS=${glassfish_pass}
GF_USER=${glassfish_user}

echo "INFO: Sourced Glassfish home: ${GF_HOME}"
echo "INFO: Sourced Glassfish pattern: ${GF_PATTERN}"
echo "INFO: Sourced Glassfish pass: ${GF_PASS}"
echo "INFO: Sourced Glassfish user: ${GF_USER}"

# Make sure Glassfish is running

PROCS=`ps -ef|grep ${GF_PATTERN}|grep -v grep|awk '{print $2}'`

if [ -z "${PROCS}" ]
then
	echo -e "${color_red_light}ERROR: Glassfish is not running.${color_off}"
	exit 1
fi

# Proceed with the application redeployment

APP_NAME=${1}
APP_VERSION=${2}
APP_FILE=${3}

echo "INFO: Redeploying application ${APP_NAME} at version ${APP_VERSION} from file ${APP_FILE}..."
${GF_HOME}/bin/asadmin --user ${GF_USER} --passwordfile ${GF_PASS} redeploy --name ${APP_NAME}:${APP_VERSION} --keepstate=true ${APP_FILE}

if [ "$?" -eq 0 ]
then
	echo "INFO: Redeployment successfully completed."
else
	echo -e "${color_red_light}ERROR: Redeployment failed to complete.${color_off}"
	exit 1
fi

exit 0

#!/usr/bin/env bash

# @(#)Redploy-JBoss.sh	0.1.2	08/26/2015
# @(#)Redploy-JBoss.sh	0.1.1	10/28/2014
# @(#)Redploy-JBoss.sh	0.1.0	10/08/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.2
# @updated      $LastChangedDate: 2015-09-11 15:41:47 -0400 (Fri, 11 Sep 2015) $
# @revision     $LastChangedRevision: 3016 $

# Usage:
#	Redploy-JBoss.sh <application-name> <application-file> [--force] [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg
FORCE_DEPLOY=false

if [ "$#" -lt 2 ] || [ "$#" -gt 4 ]
then
	echo "Usage: $0 <application-name> <application-file> [--force] [optional-configuration-file-path]"
	exit 1
fi

echo "INFO: Using colors file ${COLORS_FILE}..."

source ${COLORS_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source colors file ${COLORS_FILE}."
	exit 1
fi

if [ "$#" -eq 2 ]
then
        CONFIG_FILE=${HOME}/Config/JBoss.cfg
elif [ "$#" -eq 3 ]
then
	if [ "${3}" = "--force" ]
	then
		echo "INFO: Will allow deploy if undeploy fails."
		FORCE_DEPLOY=true
        	CONFIG_FILE=${HOME}/Config/JBoss.cfg
	else
        	CONFIG_FILE=${3}
	fi
else
	if [ "${3}" = "--force" ]
	then
		echo "INFO: Will allow deploy if undeploy fails."
		FORCE_DEPLOY=true
	else
		echo -e "${color_red_light}ERROR: ${3} is unrecognized.${color_off}"
		echo "Usage: $0 <application-name> <application-file> [--force] [optional-configuration-file-path]"
		exit 1
	fi

        CONFIG_FILE=${4}
fi

echo "INFO: Using configuration file ${CONFIG_FILE}..."

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Unable to source configuration file ${CONFIG_FILE}.${color_off}"
	exit 1
fi

if [ -z "${jboss_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable jboss_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${jboss_pattern}" ]
then
        echo -e "${color_red_light}ERROR: Variable jboss_pattern was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

JB_HOME=${jboss_home}
JB_PATTERN=${jboss_pattern}

echo "INFO: Sourced JBoss home: ${JB_HOME}"
echo "INFO: Sourced JBoss pattern: ${JB_PATTERN}"

# Make sure JBoss is running

PROCS=`ps -ef|grep ${JB_PATTERN}|grep -v grep|awk '{print $2}'`

if [ -z "${PROCS}" ]
then
	echo -e "${color_red_light}ERROR: JBoss is not running.${color_off}"
	exit 1
fi

# Proceed with the application redeployment

APP_NAME=${1}
APP_FILE=${2}

echo "INFO: Undeploying application ${APP_NAME}..."

${JB_HOME}/bin/jboss-cli.sh --connect "undeploy ${APP_NAME}"

if [ "$?" -eq 0 ]
then
	echo "INFO: Undeployment successfully completed."
else
	if [ "${FORCE_DEPLOY}" = "false" ]
	then
		echo -e "${color_red_light}ERROR: Undeployment failed to complete.${color_off}"
		exit 1
	else
		echo -e "${color_yellow}WARN: Undeployment failed to complete.${color_off}"
	fi
fi

echo "INFO: Deploying application ${APP_NAME} from file ${APP_FILE}..."

${JB_HOME}/bin/jboss-cli.sh --connect "deploy ${APP_FILE} --name=${APP_NAME}"

if [ "$?" -eq 0 ]
then
	echo "INFO: Deployment successfully completed."
else
	echo -e "${color_red_light}ERROR: Deployment failed to complete.${color_off}"
	exit 1
fi

exit 0

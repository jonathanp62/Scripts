#!/usr/bin/env bash

# @(#)Clojure.sh        0.1.1   08/26/2015
# @(#)Clojure.sh	0.1.0	07/13/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-09-01 11:52:17 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2988 $

# Usage:
#       Clojure.sh [optional-configuration-file-path]

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -gt 1 ]
then
        echo "Usage: ${0} [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -eq 1 ]
then
	CONFIG_FILE=${1}
else
	CONFIG_FILE=${HOME}/Config/Clojure.cfg
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

if [ -z "${clojure_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable clojure_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${clojure_jar}" ]
then
        echo -e "${color_red_light}ERROR: Variable clojure_jar was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

CLOJURE_HOME=${clojure_home}
CLOJURE_JAR=${clojure_jar}

java -cp ${CLOJURE_HOME}/${CLOJURE_JAR} clojure.main

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Clojure REPL failed to start or did not complete OK.${color_off}"
	exit 1
fi

exit 0

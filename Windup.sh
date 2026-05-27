#!/usr/bin/env bash

# @(#)Windup.sh 0.1.1   09/01/2015
# @(#)Windup.sh	0.1.0	09/12/2014
#
# MIT License
#
# Copyright (c) 2026 Jonathan M. Parker
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-09-01 12:15:29 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2989 $

# Usage:
#       Windup.sh <application-artifact> <packages> <output-directory> [optional-configuration-file-path]

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        echo "Usage: ${0} <application-artifact> <packages> <output-directory> [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -gt 4 ]
then
        echo "Usage: ${0} <application-artifact> <packages> <output-directory> [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -eq 4 ]
then
	CONFIG_FILE=${4}
else
	CONFIG_FILE=${HOME}/Config/Windup.cfg
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

if [ -z "${windup_home}" ]
then
        echo -e "${color_red_light}ERROR: Variable windup_home was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

if [ -z "${windup_jar}" ]
then
        echo -e "${color_red_light}ERROR: Variable windup_jar was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

WINDUP_HOME=${windup_home}
WINDUP_JAR=${windup_jar}

ARTIFACT=${1}
PACKAGES=${2}
OUTPUT_DIR=${3}

echo "INFO: Running JBoss Windup on artifact ${ARTIFACT} for packages ${PACKAGES} into ${OUTPUT_DIR}..."

java -jar ${WINDUP_HOME}/${WINDUP_JAR} -javaPkgs ${PACKAGES} -input ${ARTIFACT} -output ${OUTPUT_DIR}

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: JBoss Windup failed to process application artifact ${ARTIFACT}.${color_off}"
	exit 1
fi

echo "INFO: Done running JBoss Windup on artifact ${ARTIFACT} for packages ${PACKAGES} into ${OUTPUT_DIR}."

exit 0

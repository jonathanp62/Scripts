#!/usr/bin/env bash

# @(#)Check-Local-Update.sh	0.1.0	01/15/2018
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
# @version      0.1.0
# @updated      $LastChangedDate: 2018-01-15 10:36:57 -0500 (Mon, 15 Jan 2018) $
# @revision     $LastChangedRevision: 8698 $

# Usage:
#       Check-Local-Update.sh <project-name> [optional-configuration-file-path]

if [ "`uname`" = "Darwin" ]
then
	export GREP_OPTIONS=
fi

COLORS_FILE=${HOME}/Config/Colors.cfg

if [ "$#" -eq 0 ]
then
        echo "Usage: ${0} <project-name> [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -gt 2 ]
then
        echo "Usage: ${0} <project-name> [optional-configuration-file-path]"
        exit 1
fi

if [ "$#" -eq 2 ]
then
	CONFIG_FILE={2}
else
	CONFIG_FILE=${HOME}/Config/Gitlab.cfg
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

if [ -z "${gitlab_root}" ]
then
        echo -e "${color_red_light}ERROR: Variable gitlab_root was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

GITLAB_ROOT=${gitlab_root}
PROJECT=${1}

cd ${GITLAB_ROOT}/${PROJECT}

echo "INFO: Reading folders in ${GITLAB_ROOT}/${PROJECT}..."

FOLDERS=`ls`

for FOLDER in ${FOLDERS}
do
	if [ -d $FOLDER ]
	then
		echo "INFO: Checking folder ${FOLDER}..."
		cd ${FOLDER}

		if [[ "${FOLDER}" = "ark-services" && "${PROJECT}" = "Ark" ]]
		then
			SUBFOLDERS=`ls`

			for SUBFOLDER in ${SUBFOLDERS}
			do
				if [ -d ${SUBFOLDER} ]
				then
					echo "INFO: Checking folder ${SUBFOLDER}..."
					cd ${SUBFOLDER}
					git status
					cd ..
				fi
			done
		elif [[ "${FOLDER}" = "ark-archetypes" && "${PROJECT}" = "Ark" ]]
		then
			echo "INFO: Skipping ${FOLDER}."
		else
			git status
		fi

		cd ..
	fi
done

exit 0

#!/usr/bin/env bash

# @(#)Check-Remote-Update.sh	0.1.0	01/15/2018
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2018-01-15 09:21:45 -0500 (Mon, 15 Jan 2018) $
# @revision     $LastChangedRevision: 8697 $

# Usage:
#       Check-Remote-Update.sh <project-name> [optional-configuration-file-path]

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
					git remote -v update

					if [ "$?" = "0" ]
					then
						git status -uno
					fi

					cd ..
				fi
			done
		elif [[ "${FOLDER}" = "ark-archetypes" && "${PROJECT}" = "Ark" ]]
		then
			echo "INFO: Skipping ${FOLDER}."
		else
			git remote -v update

			if [ "$?" = "0" ]
			then
				git status -uno
			fi
		fi

		cd ..
	fi
done

exit 0

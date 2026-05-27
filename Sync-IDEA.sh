#!/usr/bin/env bash

# @(#)Sync-IDEA.sh	0.1.2	09/01/2015
# @(#)Sync-IDEA.sh	0.1.1	02/24/2015
# @(#)Sync-IDEA.sh	0.1.0	07/07/2014
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
# @version      0.1.2
# @updated      $LastChangedDate: 2015-09-01 11:52:17 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2988 $

# Usage:
#	Sync-IDEA.sh [optional-configuration-file-path]

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

if [ -z "${yo_mount}" ]
then
        echo "ERROR: Variable yo_mount was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${yo_ver}" ]
then
        echo "ERROR: Variable yo_ver was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${ml_mount}" ]
then
        echo "ERROR: Variable ml_mount was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${ml_ver}" ]
then
        echo "ERROR: Variable ml_ver was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${mv_mount}" ]
then
        echo "ERROR: Variable mv_mount was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${mv_ver}" ]
then
        echo "ERROR: Variable mv_ver was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${sl_mount}" ]
then
        echo "ERROR: Variable sl_mount was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${sl_ver}" ]
then
        echo "ERROR: Variable sl_ver was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

if [ -z "${idea}" ]
then
        echo "ERROR: Variable idea was not found in the configuration file ${CONFIG_FILE}."
        exit 1
fi

OSX_SNOW_LEOPARD="${sl_ver}"
OSX_MOUNTAIN_LION="${ml_ver}"
OSX_MAVERICKS="${mv_ver}"
OSX_YOSEMITE="${yo_ver}"
OSX_VERSION=`uname -r`

echo "OS X version: ${OSX_VERSION}"

if [ "${OSX_VERSION}" = "${OSX_SNOW_LEOPARD}" ]; then
	echo "Snow Leopard is running..."
fi

if [ "${OSX_VERSION}" = "${OSX_MOUNTAIN_LION}" ]; then
	echo "Mountain Lion is running..."	
fi

if [ "${OSX_VERSION}" = "${OSX_MAVERICKS}" ]
then
	echo "Mavericks is running..."	
fi

if [ "${OSX_VERSION}" = "${OSX_YOSEMITE}" ]
then
	echo "Yosemite is running..."	
fi

OSX_SNOW_LEOPARD_MOUNT="${sl_mount}"
OSX_MOUNTAIN_LION_MOUNT="${ml_mount}"
OSX_MAVERICKS_MOUNT="${mv_mount}"
OSX_YOSEMITE_MOUNT="${yo_mount}"

IDEA="${idea}"

# Set the source and target variables based on the OS X version

if [ "${OSX_VERSION}" = "${OSX_SNOW_LEOPARD}" ]; then
	if \[ -d "${OSX_SNOW_LEOPARD_MOUNT}" \]; then
		echo "Your WMFILE-1 drive (jparker) is mounted; backup will proceed."
	else
		echo "Your WMFILE-1 drive (jparker) is not mounted."
		exit 1
	fi

	SOURCE_DIR=${HOME}
	TARGET_DIR=${OSX_SNOW_LEOPARD_MOUNT}/${IDEA}	
elif [ "${OSX_VERSION}" = "${OSX_MOUNTAIN_LION}" ]; then
	if \[ -d "${OSX_MOUNTAIN_LION_MOUNT}" \]; then
		echo "Your WMFILE-1 drive (jparker) is mounted; backup will proceed."
	else
		echo "Your WMFILE-1 drive (jparker) is not mounted."
		exit 1
	fi
	
	SOURCE_DIR=${HOME}
	TARGET_DIR=${OSX_MOUNTAIN_LION_MOUNT}/${IDEA}
elif [ "${OSX_VERSION}" = "${OSX_MAVERICKS}" ]; then
	if \[ -d "${OSX_MAVERICKS_MOUNT}" \]; then
		echo "Your WMFILE-1 drive (jparker) is mounted; backup will proceed."
	else
		echo "Your WMFILE-1 drive (jparker) is not mounted."
		exit 1
	fi
	
	SOURCE_DIR=${HOME}
	TARGET_DIR=${OSX_MAVERICKS_MOUNT}/${IDEA}	
elif [ "${OSX_VERSION}" = "${OSX_YOSEMITE}" ]; then
	if \[ -d "${OSX_YOSEMITE_MOUNT}" \]; then
		echo "Your WMFILE-1 drive (jparker) is mounted; backup will proceed."
	else
		echo "Your WMFILE-1 drive (jparker) is not mounted."
		exit 1
	fi
	
	SOURCE_DIR=${HOME}
	TARGET_DIR=${OSX_YOSEMITE_MOUNT}/${IDEA}	
else
	echo "Mac OS X version ${OSX_VERSION} is currently not supported."
	exit 1
fi

# Perform the synchronization

rsync -av --delete ${SOURCE_DIR}/IDEA-Project-Archives ${TARGET_DIR}
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/IDEA-Projects ${TARGET_DIR}

exit 0

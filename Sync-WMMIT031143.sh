#!/usr/bin/env bash

# @(#)Sync-WMMIT031143.sh	0.1.2	09/01/2015
# @(#)Sync-WMMIT031143.sh	0.1.1	02/24/2015
# @(#)Sync-WMMIT031143.sh	0.1.0	07/07/2014
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
#       Sync-WMMIT031143.sh [optional-configuration-file-path]

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

if [ -z "${macpro}" ]
then
        echo "ERROR: Variable macpro was not found in the configuration file ${CONFIG_FILE}."
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

MACPRO=${macpro}

# Set the source and target variables based on the OS X version

if [ "${OSX_VERSION}" = "${OSX_SNOW_LEOPARD}" ]; then
	if \[ -d "${OSX_SNOW_LEOPARD_MOUNT}" \]; then
		echo "Your WMFILE-1 drive (jparker) is mounted; backup will proceed."
	else
		echo "Your WMFILE-1 drive (jparker) is not mounted."
		exit 1
	fi

	SOURCE_DIR=${HOME}
	TARGET_DIR=${OSX_SNOW_LEOPARD_MOUNT}/${MACPRO}
elif [ "${OSX_VERSION}" = "${OSX_MOUNTAIN_LION}" ]; then
	if \[ -d "${OSX_MOUNTAIN_LION_MOUNT}" \]; then
		echo "Your WMFILE-1 drive (jparker) is mounted; backup will proceed."
	else
		echo "Your WMFILE-1 drive (jparker) is not mounted."
		exit 1
	fi
	
	SOURCE_DIR=${HOME}
	TARGET_DIR=${OSX_MOUNTAIN_LION_MOUNT}/${MACPRO}
elif [ "${OSX_VERSION}" = "${OSX_MAVERICKS}" ]; then
	if \[ -d "${OSX_MAVERICKS_MOUNT}" \]; then
		echo "Your WMFILE-1 drive (jparker) is mounted; backup will proceed."
	else
		echo "Your WMFILE-1 drive (jparker) is not mounted."
		exit 1
	fi
	
	SOURCE_DIR=${HOME}
	TARGET_DIR=${OSX_MAVERICKS_MOUNT}/${MACPRO}
elif [ "${OSX_VERSION}" = "${OSX_YOSEMITE}" ]; then
	if \[ -d "${OSX_YOSEMITE_MOUNT}" \]; then
		echo "Your WMFILE-1 drive (jparker) is mounted; backup will proceed."
	else
		echo "Your WMFILE-1 drive (jparker) is not mounted."
		exit 1
	fi
	
	SOURCE_DIR=${HOME}
	TARGET_DIR=${OSX_YOSEMITE_MOUNT}/${MACPRO}
else
	echo "Mac OS X version ${OSX_VERSION} is currently not supported."
	exit 1
fi

# Perform the synchronization

echo "Syncing ${SOURCE_DIR}/Archives..."
rsync -av --delete ${SOURCE_DIR}/Archives "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Artesia..."
rsync -av --delete ${SOURCE_DIR}/Artesia "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Branches..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/Branches "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Certificates..."
rsync -av --delete ${SOURCE_DIR}/Certificates "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Config..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/Config "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Databases..."
rsync -av --delete ${SOURCE_DIR}/Databases "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Documents..."
rsync -av --delete ${SOURCE_DIR}/Documents "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/DTDs..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/DTDs "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/epub..."
rsync -av --delete ${SOURCE_DIR}/ePub "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/FileMaker..."
rsync -av --delete ${SOURCE_DIR}/FileMaker "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Flash..."
rsync -av --delete ${SOURCE_DIR}/Flash "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Go-Projects..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/Go-Projects "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Gradle-Scripts..."
rsync -av --delete --exclude=".svn" "${SOURCE_DIR}/Gradle-Scripts" "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Groovy Projects..."
rsync -av --delete --exclude=".svn" "${SOURCE_DIR}/Groovy Projects" "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/IDEA-Project-Archives..."
rsync -av --delete ${SOURCE_DIR}/IDEA-Project-Archives "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/IDEA-Projects..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/IDEA-Projects "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Java..."
rsync -av --delete ${SOURCE_DIR}/Java "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Javadoc..."
rsync -av --delete ${SOURCE_DIR}/Javadoc "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/JNDI..."
rsync -av --delete ${SOURCE_DIR}/JNDI "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/JSON..."
rsync -av --delete ${SOURCE_DIR}/JSON "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/KeeperData..."
rsync -av --delete ${SOURCE_DIR}/KeeperData "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Maven Projects..."
rsync -av --delete "${SOURCE_DIR}/Maven Projects" "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/MKS Sandboxes..."
rsync -av --delete "${SOURCE_DIR}/MKS Sandboxes" "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/MySQL..."
rsync -av --delete ${SOURCE_DIR}/MySQL "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/NetBeans-Applications..."
rsync -av --delete ${SOURCE_DIR}/NetBeans-Applications "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/NetBeans-Libraries..."
rsync -av --delete ${SOURCE_DIR}/NetBeans-Libraries "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/NetBeans-Project-Archives..."
rsync -av --delete ${SOURCE_DIR}/NetBeans-Project-Archives "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/NetBeans-Projects..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/NetBeans-Projects "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/NetBeans-Sites..."
rsync -av --delete ${SOURCE_DIR}/NetBeans-Sites "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Old Projects..."
rsync -av --delete "${SOURCE_DIR}/Old Projects" "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/OTMM70..."
rsync -av --delete ${SOURCE_DIR}/OTMM70 "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/OTMM70WS..."
rsync -av --delete ${SOURCE_DIR}/OTMM70WS "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Oracle..."
rsync -av --delete ${SOURCE_DIR}/Oracle "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Schemas..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/Schemas "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Scripts..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/Scripts "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Sites..."
rsync -av --delete ${SOURCE_DIR}/Sites "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/SoapUI-Projects..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/SoapUI-Projects "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Sony..."
rsync -av --delete ${SOURCE_DIR}/Sony "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Temp..."
rsync -av --delete ${SOURCE_DIR}/Temp "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Web-Sites..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/Web-Sites "${TARGET_DIR}"
echo "Syncing ${SOURCE_DIR}/Xcode-Projects..."
rsync -av --delete --exclude=".svn" ${SOURCE_DIR}/Xcode-Projects "${TARGET_DIR}"

echo "Syncing /usr/local..."
sudo rsync -av --delete --exclude=".svn" /usr/local "/Volumes/jparker"

echo "Backup has completed."
exit 0

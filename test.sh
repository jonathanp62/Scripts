#!/usr/bin/env bash

# @(#)test.sh	0.1.1	01/18/2017
# @(#)test.sh	0.1.0	09/03/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2017-01-18 17:43:44 -0500 (Wed, 18 Jan 2017) $
# @revision     $LastChangedRevision: 6423 $
#
# Usage:
#       test.sh

OSX_VERSION=`uname -r`
OSX_SNOW_LEOPARD="10.8.0"
OSX_MOUNTAIN_LION="12.5.0"
OSX_MAVERICKS="13.4.0"
OSX_YOSEMITE="14.5.0"
OSX_SIERRA="16.3.0"
OSX_SL=${OSX_SNOW_LEOPARD}
OSX_ML=${OSX_MOUNTAIN_LION}
OSX_MV=${OSX_MAVERICKS}
OSX_YO=${OSX_YOSEMITE}
OSX_SI=${OSX_SIERRA}

echo "OS X version: $OSX_VERSION"

if [ "${OSX_VERSION}" = "${OSX_SL}" ]; then
	echo "Snow Leopard is running"
fi

if [ "${OSX_VERSION}" = "${OSX_ML}" ]; then
	echo "Mountain Lion is running"
fi

if [ "${OSX_VERSION}" = "${OSX_MV}" ]; then
	echo "Mavericks is running"
fi

if [ "${OSX_VERSION}" = "${OSX_YO}" ]; then
	echo "Yosemite is running"
fi

if [ "${OSX_VERSION}" = "${OSX_SI}" ]; then
	echo "Sierra is running"
fi

# Mountain Lion, Mavericks section

if [[ "${OSX_VERSION}" = "${OSX_ML}" || "${OSX_VERSION}" = "${OSX_MV}" ]]; then
	if \[ -d "/Volumes/My Book" \]; then
		echo "My Book is mounted"
	else
		echo "My Book is not mounted"
	fi
	
	if \[ -d "/Volumes/Time Machine Backup Drive" \]; then
		echo "Time Machine is mounted"
	else
		echo "Time Machine is not mounted"
	fi
	
	if \[ -d "/Volumes/Seagate BKUP" \]; then
		echo "Seagate is mounted"
	else
		echo "Seagate is not mounted"
	fi
	
	if \[ -d "/Volumes/users/jparker" \]; then
		echo "jparker is mounted"
	else
		echo "jparker is not mounted"
	fi
fi

# Snow Leopard section

if [ "${OSX_VERSION}" = "${OSX_SL}" ]; then	
	if \[ -d "/Volumes/31143_Backup HD" \]; then
		echo "Time Machine is mounted"
	else
		echo "Time Machine is not mounted"
	fi
	
	if \[ -d "/Volumes/jparker" \]; then
		echo "jparker is mounted"
	else
		echo "jparker is not mounted"
	fi
fi

# Yosemite section

if [ "${OSX_VERSION}" = "${OSX_YO}" ]; then	
	if \[ -d "/Volumes/My Passport" \]; then
		echo "Time Machine is mounted"
	else
		echo "Time Machine is not mounted"
	fi
	
	if \[ -d "/Volumes/jparker" \]; then
		echo "jparker is mounted"
	else
		echo "jparker is not mounted"
	fi
fi

# Sierra section

if [ "${OSX_VERSION}" = "${OSX_SI}" ]; then	
	if \[ -d "/Volumes/My Passport" \]; then
		echo "Time Machine is mounted"
	else
		echo "Time Machine is not mounted"
	fi
	
	if \[ -d "/Volumes/jparker" \]; then
		echo "jparker is mounted"
	else
		echo "jparker is not mounted"
	fi
fi

exit 0

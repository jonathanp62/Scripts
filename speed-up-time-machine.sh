#!/usr/bin/env bash

# @(#)speed-up-time-machine.sh	0.1.1	07/29/2022
# @(#)speed-up-time-machine.sh	0.1.0	05/23/2022
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2020-11-05 09:29:13 -0500 (Thu, 05 Nov 2020) $
# @revision     $LastChangedRevision: 13143 $
#
# Usage:
#       speed-up-time-machine.sh <on|off>

if [ "$#" -eq 0 ]
then
        echo "Usage: ${0} <on|off>"
        exit 1
fi

if [ ${1} = "on" ]
then
	VALUE=0
elif [ ${1} = "off" ]
then
	VALUE=1
else
    echo "Usage: $0 <on|off>"
    exit 1
fi

sudo sysctl debug.lowpri_throttle_enabled=${VALUE}

if [ ${1} = "on" ]
then
	echo "INFO: The low priority throttle has been disabled"
else
	echo "INFO: The low priority throttle has been enabled"
fi

exit 0

#!/usr/bin/env bash

# @(#)reset-software-update-prefs.sh	0.1.0	06/03/2022
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2020-11-05 09:29:13 -0500 (Thu, 05 Nov 2020) $
# @revision     $LastChangedRevision: 13143 $
#
# Usage:
#       reset-software-update-prefs.sh

sudo rm /Library/Preferences/com.apple.SoftwareUpdate.plist

if [ $? -eq 0 ]
then
	echo "INFO: Restart macOS and try the Software Update again"
fi

exit 0

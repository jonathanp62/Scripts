#!/usr/bin/env bash
#
# @(#)trash.sh	0.1.0	08/25/2023
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate$
# @revision     $LastChangedRevision$
#
# Usage:
#       trash.sh [--force| -f] args ...

if [ "${#}" -eq 0 ]
then
	echo "usage: ${0} args [--force| -f] ..."
	exit 1
fi
 
if [ "${1}" = "--force" ] || [ "${1}" = "-f" ]
then
	FORCE=-f
	shift
else
	FORCE=
fi

while [ "${#}" -gt 0 ]
do
	mv ${FORCE} ${1} ${HOME}/.Trash
	shift
done

exit 0

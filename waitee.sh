#!/bin/zsh

# @(#)waitee.sh	0.1.0	08/23/2020
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2020-09-10 15:16:22 -0400 (Thu, 10 Sep 2020) $
# @revision     $LastChangedRevision: 12926 $
#
# Usage:
#       waitee.sh

sig_handler() 
{
	exit 0
}

trap sig_handler SIGTERM

while :
do
	echo "Child process is sleeping."
	sleep 2
done

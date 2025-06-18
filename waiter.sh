#!/bin/zsh

# @(#)waiter.sh	0.1.0	08/23/2020
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
#       waiter.sh

PID=

sig_handler()
{
	echo "Handling SIGTERM in parent process."
	echo "Stopping child process ${PID}..."
        kill ${PID}
	echo "Exiting parent process."
	exit 0
}

trap sig_handler SIGTERM

echo "Parent process is starting a child process..."

./waitee.sh &

PID=$!

echo "Now waiting on child process ${PID} or a SIGTERM."

wait ${PID}

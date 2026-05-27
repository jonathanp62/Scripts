#!/usr/bin/env zsh

# @(#)Stop-Redis.sh	0.3.0	06/23/2024
# @(#)Stop-Redis.sh	0.2.0	05/20/2024
# @(#)Stop-Redis.sh	0.1.0	04/29/2024
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
# @version      0.3.0
#
# Usage:
#       Stop-Redis.sh

STACK_PATTERN="../bin/redis-server"
PROCESS=$(ps -ef|grep -F ${STACK_PATTERN}|grep -v grep|awk '{print $2}')

if [ -z "${PROCESS}" ]
then
	echo "INFO: Redis stack server is not running locally"

	REDIS_PATTERN="opt/redis/bin/redis-server"
	PROCESS=$(ps -ef|grep ${REDIS_PATTERN}|grep -v grep|awk '{print $2}')

	if [ -z ${PROCESS} ]
	then
		echo "INFO: Redis server is not running locally"
	else
		echo "INFO: Redis server is running locally as process ${PROCESS}"
		brew services stop redis
		exit 0
	fi
else
	echo "INFO: Redis stack server is running locally as process ${PROCESS}"
	kill ${PROCESS}
	sleep 1

	PROCESS=$(ps -ef|grep ${STACK_PATTERN}|grep -v grep|awk '{print $2}')

	if [ -z "${PROCESS}" ]
	then
		echo "INFO: Redis stack server is no longer running"
	else
		echo "ERROR: Redis stack server failed to be killed"
		exit 1
	fi
fi

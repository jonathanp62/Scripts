#!/usr/bin/env zsh

# @(#)Start-Redis.sh	0.3.0	06/23/2024
# @(#)Start-Redis.sh	0.2.0	05/20/2024
# @(#)Start-Redis.sh	0.1.0	04/29/2024
#
# Copyright (c) Jonathan Martin Parker.
# 324 Lantana Drivce
# Owings Mills, MD 21117 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.3.0
#
# Usage:
#       Start-Redis.sh [--stack | -s]

# Determine if we are trying to start the regular Redis server or the stack server

if [ "$#" -eq 0 ]
then
	STACK_SERVER=false
else
	if [[ "${1}" = "--stack" || "${1}" = "-s" ]]
	then
		STACK_SERVER=true
	else
		STACK_SERVER=false
	fi
fi

if [ "${STACK_SERVER}" = "true" ]
then
	echo "Attemping to start the Redis stack server"
else
	echo "Attemping to start the Redis server"
fi

# Make sure neither Redis server is running

REDIS_IS_RUNNING=true

STACK_PATTERN="../bin/redis-server"
PROCESS=$(ps -ef|grep -F ${STACK_PATTERN}|grep -v grep|awk '{print $2}')

if [ -z "${PROCESS}" ]
then
	REDIS_PATTERN="opt/redis/bin/redis-server"
	PROCESS=$(ps -ef|grep ${REDIS_PATTERN}|grep -v grep|awk '{print $2}')

	if [ -z "${PROCESS}" ]
	then
		REDIS_IS_RUNNING=false
	fi
fi

# If Redis is not running then start it

if [ "${REDIS_IS_RUNNING}" = "false" ]
then
	if [ "${STACK_SERVER}" = "true" ]
	then
		if [ "${ARCHITECTURE}" = "silicon" ]
		then
			BIN_DIR=/opt/homebrew/Caskroom/redis-stack-server/7.4.0-v0/bin
		else
			BIN_DIR=/usr/local/Caskroom/redis-stack-server/7.2.0-v10/bin
		fi

		echo "INFO: Redis stack server is not running locally"

		# Changing to the bin directory so the nohup.out file goes there

		if cd ${BIN_DIR}
		then
			if [ -f ./nohup.out ]
			then
				echo "INFO: Found nohup.out; removing it"
				rm ./nohup.out
			fi

			nohup ./redis-stack-server &
		else
			echo "ERROR: Failed to change to ${BIN_DIR}"
		fi
	else
		echo "INFO: Redis server is not running locally"

		brew services start redis
	fi
else
	REDIS_PATTERN="opt/redis/bin/redis-server"
	PROCESS=$(ps -ef|grep ${REDIS_PATTERN}|grep -v grep|awk '{print $2}')

	if [ ! -z "${PROCESS}" ]
	then
		echo "INFO: Redis server is already running locally as process ${PROCESS}"
	else
		STACK_PATTERN="../bin/redis-server"
		PROCESS=$(ps -ef|grep -F ${STACK_PATTERN}|grep -v grep|awk '{print $2}')

		echo "INFO: Redis stack server is already running locally as process ${PROCESS}"
	fi
fi

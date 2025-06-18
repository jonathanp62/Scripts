#!/usr/bin/env zsh

# @(#)Status-Redis.sh	0.3.0	06/23/2024
# @(#)Status-Redis.sh	0.2.0	05/20/2024
# @(#)Status-Redis.sh	0.1.0	04/29/2024
#
# Copyright (c) Jonathan Martin Parker
# 324 Lantana Drive
# Owings Mills, MD 21117 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.3.0
#
# Usage:
#       Status-Redis.sh

STACK_PATTERN="../bin/redis-server"
PROCESS=$(ps -ef|grep -F ${STACK_PATTERN}|grep -v grep|awk '{print $2}')

if [ -z "${PROCESS}" ]
then
	echo "INFO: Redis stack server is not running locally"
else
	echo "INFO: Redis stack server is running locally as process ${PROCESS}"
fi

REDIS_PATTERN="opt/redis/bin/redis-server"
PROCESS=$(ps -ef|grep ${REDIS_PATTERN}|grep -v grep|awk '{print $2}')

if [ -z ${PROCESS} ]
then
	echo "INFO: Redis server is not running locally"
else
	echo "INFO: Redis server is running locally as process ${PROCESS}"
	brew services info redis
fi

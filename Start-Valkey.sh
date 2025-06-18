#!/usr/bin/env zsh

# @(#)Start-Valkey.sh	0.1.0	04/28/2025
#
# @author       Jonathan Parker
# @version      0.1.0
# @since        0.1.0
#
# Usage:
#       Start-Valkey.sh
#
# MIT License
#
# Copyright (c) 2025 Jonathan M. Parker
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

CONTAINER_NAME=local-valkey
IMAGE_NAME=valkey/valkey
PORT=6379

CONTAINER=$(docker container ls --filter "name=${CONTAINER_NAME}" -qa)

if [ -z "${CONTAINER}" ]
then
	echo "Running ${CONTAINER_NAME}"
	docker run -d -p ${PORT}:${PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest
else
	ACTIVE=$(docker container ls --filter "name=${CONTAINER_NAME}" --filter "status=running" -q)

	if [ -z "${ACTIVE}" ]
	then
		echo "Starting ${CONTAINER_NAME}"
		docker start ${CONTAINER_NAME}
	else
		echo "${CONTAINER_NAME} is already running"
	fi
fi

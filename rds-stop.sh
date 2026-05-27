#!/usr/bin/env zsh

# @(#)rds-stop.sh	0.1.0	07/05/2020
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
# @version      0.1.0
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $

# Usage:
#       rds-stop.sh

AWS_CLI_HOME=/usr/local/aws-cli
INSTANCE_ID=$(cat ${HOME}/Config/rds-instance-id.cfg)
QUERY="DBInstances[0].DBInstanceStatus"
PROFILE=default

cd ${AWS_CLI_HOME}

STATUS=$(aws rds describe-db-instances --db-instance-identifier ${INSTANCE_ID} --query ${QUERY} --profile ${PROFILE})
STATUS=$(echo ${STATUS} | tr -d '"')

if [ ${STATUS} != "stopped" ]; then
	echo "Stopping RDS instance ${INSTANCE_ID}..."
	aws rds stop-db-instance --db-instance-identifier ${INSTANCE_ID} --profile ${PROFILE}

	COUNT=0
	LIMIT=60

	while [ ${COUNT} -lt ${LIMIT} ]
	do
		sleep 30
		COUNT=$((COUNT + 1))

		STATUS=$(aws rds describe-db-instances --db-instance-identifier ${INSTANCE_ID} --query ${QUERY} --profile ${PROFILE})
		STATUS=$(echo ${STATUS} | tr -d '"')

		if [ ${STATUS} = "stopped" ]; then
			echo "RDS instance ${INSTANCE_ID} is now stopped."
			break
		else
			echo "RDS instance ${INSTANCE_ID} is not yet stopped..."
		fi
	done

	if [ ${COUNT} -ge ${LIMIT} ]; then
		exit 255
	else
		exit 0
	fi
else
	echo "RDS instance ${INSTANCE_ID} is already stopped."
fi

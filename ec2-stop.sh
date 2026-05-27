#!/usr/bin/env zsh

# @(#)ec2-stop.sh	0.1.0	06/14/2020
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
#       ec2-stop.sh

AWS_CLI_HOME=/usr/local/aws-cli
INSTANCE_ID=$(cat ${HOME}/Config/ec2-instance-id.cfg)
QUERY="Reservations[0].Instances[0].State.Name"
PROFILE=ec2-all-actions

cd ${AWS_CLI_HOME}

STATUS=$(aws ec2 describe-instances --instance-ids ${INSTANCE_ID} --query ${QUERY} --profile ${PROFILE})
STATUS=$(echo ${STATUS} | tr -d '"')

if [ ${STATUS} != "stopped" ]; then
	echo "Stopping EC2 instance ${INSTANCE_ID}..."
	aws ec2 stop-instances --instance-ids ${INSTANCE_ID} --profile ${PROFILE}

	echo "Waiting for EC2 instance ${INSTANCE_ID} to be stopped..."
	aws ec2 wait instance-stopped --instance-ids ${INSTANCE_ID} --profile ${PROFILE}

	echo "EC2 instance ${INSTANCE_ID} is now stopped."
else
	echo "EC2 instance ${INSTANCE_ID} is already stopped."
fi

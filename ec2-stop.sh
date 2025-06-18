#!/usr/bin/env zsh

# @(#)ec2-stop.sh	0.1.0	06/14/2020
#
# Copyright (c) Penguin Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
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

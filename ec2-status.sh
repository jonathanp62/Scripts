#!/usr/bin/env zsh

# @(#)ec2-status.sh	0.1.0	07/06/2020
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
#       ec2-status.sh

AWS_CLI_HOME=/usr/local/aws-cli
INSTANCE_ID=$(cat ${HOME}/Config/ec2-instance-id.cfg)
QUERY="Reservations[0].Instances[0].State.Name"
PROFILE=ec2-all-actions

cd ${AWS_CLI_HOME}

STATUS=$(aws ec2 describe-instances --instance-ids ${INSTANCE_ID} --query ${QUERY} --profile ${PROFILE})
STATUS=$(echo ${STATUS} | tr -d '"')

if [ ${STATUS} = "stopped" ]; then
	echo "EC2 instance ${INSTANCE_ID} is stopped."
elif [ ${STATUS} = "running" ]; then
	echo "EC2 instance ${INSTANCE_ID} is running."
else
	echo "EC2 instance ${INSTANCE_ID} is in state ${STATUS}."
fi

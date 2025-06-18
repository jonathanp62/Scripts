#!/usr/bin/env zsh

# @(#)rds-status.sh	0.1.0	07/06/2020
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
#       rds-status.sh

AWS_CLI_HOME=/usr/local/aws-cli
INSTANCE_ID=$(cat ${HOME}/Config/rds-instance-id.cfg)
QUERY="DBInstances[0].DBInstanceStatus"
PROFILE=default

cd ${AWS_CLI_HOME}

STATUS=$(aws rds describe-db-instances --db-instance-identifier ${INSTANCE_ID} --query ${QUERY} --profile ${PROFILE})
STATUS=$(echo ${STATUS} | tr -d '"')

if [ ${STATUS} = "stopped" ]; then
	echo "RDS instance ${INSTANCE_ID} is stopped."
elif [ ${STATUS} = "available" ]; then
	echo "RDS instance ${INSTANCE_ID} is available."
else
	echo "RDS instance ${INSTANCE_ID} is in state ${STATUS}."
fi

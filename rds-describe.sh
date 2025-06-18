#!/usr/bin/env zsh

# @(#)rds-describe.sh	0.1.0	07/05/2020
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
#       rds-describe.sh

AWS_CLI_HOME=/usr/local/aws-cli
INSTANCE_ID=$(cat ${HOME}/Config/rds-instance-id.cfg)
PROFILE=default
QUERY="{id:DBInstances[0].DBInstanceIdentifier,state:DBInstances[0].DBInstanceStatus}"

cd ${AWS_CLI_HOME}

aws rds describe-db-instances --db-instance-identifier ${INSTANCE_ID} --query ${QUERY} --profile ${PROFILE}

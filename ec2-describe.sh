#!/usr/bin/env zsh

# @(#)ec2-describe.sh	0.1.0	06/14/2020
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
#       ec2-describe.sh

AWS_CLI_HOME=/usr/local/aws-cli
FILTERS="Name=tag:name,Values=my-ec2-instance"
INSTANCE_ID=$(cat ${HOME}/Config/ec2-instance-id.cfg)
PROFILE=ec2-all-actions
QUERY="{id:Reservations[0].Instances[0].InstanceId,state:Reservations[0].Instances[0].State.Name,publicdns:Reservations[0].Instances[0].PublicDnsName}"

cd ${AWS_CLI_HOME}

aws ec2 describe-instances --instance-ids ${INSTANCE_ID} --query ${QUERY} --filters ${FILTERS} --profile ${PROFILE}

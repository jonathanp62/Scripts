#!/usr/bin/env bash

# @(#)Fail-Builds.sh	0.1.0	09/03/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2015-09-04 14:59:34 -0400 (Fri, 04 Sep 2015) $
# @revision     $LastChangedRevision: 2998 $
#
# Usage:
#       Fail-Builds.sh

APP_HOME=/usr/local/build-request-failer

cd ${APP_HOME}/bin

./runAll.sh
sleep 3

cd ${APP_HOME}/logs

tail -f build-request-failer.log

#!/usr/bin/env bash

# @(#)HostName.sh	0.1.0	05/19/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2015-05-19 13:07:06 -0400 (Tue, 19 May 2015) $
# @revision     $LastChangedRevision: 2526 $
#
# Usage:
#	HostName.sh

CLASSPATH=${HOME}/NetBeans-Applications/HostName-0.1.0.jar
CLASSNAME=com.rh.examples.HostName

java -cp "${CLASSPATH}" ${CLASSNAME}

#!/usr/bin/env bash

# @(#)Processors.sh	0.1.0	10/21/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2015-10-21 08:53:17 -0400 (Wed, 21 Oct 2015) $
# @revision     $LastChangedRevision: 3107 $
#
# Usage:
#	Processors.sh

CLASSPATH=\
${HOME}/NetBeans-Applications/processors-0.1.0.jar

CLASSNAME=com.prh.util.processors.Main

java -cp "${CLASSPATH}" ${CLASSNAME}

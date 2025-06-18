#!/usr/bin/env bash

# @(#)Blocksizes.sh	0.1.1	12/01/2015
# @(#)Blocksizes.sh	0.1.0	11/30/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-12-02 08:19:29 -0500 (Wed, 02 Dec 2015) $
# @revision     $LastChangedRevision: 3292 $
#
# Usage:
#	Blocksizes.sh <file-name>

CLASSPATH=\
${HOME}/NetBeans-Applications/blocksizes-0.1.1.jar

CLASSNAME=net.jonathan.sample.blocksizes.Main

java -enableassertions -server -cp "${CLASSPATH}" ${CLASSNAME} "$@"

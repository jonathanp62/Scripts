#!/usr/bin/env bash

# @(#)SHA-256.sh	0.1.0	01/29/2016
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2016-01-29 09:52:27 -0500 (Fri, 29 Jan 2016) $
# @revision     $LastChangedRevision: 3622 $
#
# Usage:
#	SHA-256.sh <plain-text-phrase>

CLASSPATH=\
${HOME}/NetBeans-Applications/sha-calculator-0.1.0.jar

CLASSNAME=jmp.sha.calculator.Main

java -cp "${CLASSPATH}" ${CLASSNAME} "$@"

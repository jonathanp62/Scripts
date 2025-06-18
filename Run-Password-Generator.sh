#!/usr/bin/env bash

# @(#)Run-Password-Generator.sh	1.0.1	05/19/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        1.0.1
# @version      1.0.1
# @updated      $LastChangedDate: 2015-05-19 13:07:06 -0400 (Tue, 19 May 2015) $
# @revision     $LastChangedRevision: 2526 $
#
# Usage:
#	Run-Password-Generator.sh [-signs|+signs] [-len <nn>]

if [ "$#" -gt 3 ]
then
        echo "Usage: ${0} [-signs|+signs] [-len nn]"
        exit 1
fi

JAVA_CLASSPATH=${HOME}/NetBeans-Applications/Password-Generator.jar
JAVA_CLASS_NAME=com.rh.util.password.generator.Main

java -classpath ${JAVA_CLASSPATH} ${JAVA_CLASS_NAME} ${1} ${2} ${3}

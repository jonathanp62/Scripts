#!/usr/bin/env bash

# @(#)First-Lambda.sh	0.1.0	06/02/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2015-06-02 14:31:07 -0400 (Tue, 02 Jun 2015) $
# @revision     $LastChangedRevision: 2542 $
#
# Usage:
#	First-Lambda.sh

CLASSPATH=\
${HOME}/NetBeans-Applications/first-lambda-0.1.0.jar

CLASSNAME=net.jonathan.demos.lambdas.FirstLambda

java -cp ${CLASSPATH} ${CLASSNAME}

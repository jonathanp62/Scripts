#!/usr/bin/env bash

# @(#)uuid-generator.sh	0.1.1	12/10/2015
# @(#)uuid-generator.sh	0.1.0	01/12/2015
#
# Copyright (c) Penguin Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-12-10 06:56:18 -0500 (Thu, 10 Dec 2015) $
# @revision     $LastChangedRevision: 3335 $

# Usage:
#       uuid-generator.sh [number-of-uuids]

java -cp ${HOME}/NetBeans-Applications/uuid-generator-0.1.1.jar net.jonathan.util.uuid.generator.Main ${1}

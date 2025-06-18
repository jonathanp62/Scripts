#!/usr/bin/env bash

# @(#)New-Build-Id.sh	0.1.1	02/09/2015
# @(#)New-Build-Id.sh	0.1.0	04/08/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-02-09 09:56:02 -0500 (Mon, 09 Feb 2015) $
# @revision     $LastChangedRevision: 2277 $
#
# Usage:
#       New-Build-Id.sh

DATE_CMD=/bin/date

${DATE_CMD}
echo `${DATE_CMD} '+%m%d20%y%H%M%S'`
echo `${DATE_CMD} '+%m%d20%y'`
echo `${DATE_CMD} '+%H%M%S'`
exit 0

#!/usr/bin/env bash

# @(#)Set-Tastebook-Flags.sh	0.1.1	07/25/2014
# @(#)Set-Tastebook-Flags.sh	0.1.0	07/16/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2014-07-25 10:59:47 -0400 (Fri, 25 Jul 2014) $
# @revision     $LastChangedRevision: 1505 $

# Usage:
#       . ./Set-Tastebook-Flags.sh

PROPERTIES="\
-Dtastebook.search.solr.enabled=false \
-Dtastebook.solr.messagequeue.enabled=false \
-Dlogging.log4j.logger.tastebook.fetch=trace \
-Dlogging.log4j.logger.tastebook.parser=trace\
"

echo "Setting the following properties for Tastebook WS..."
echo ${PROPERTIES}

export WS_FLAGS=${PROPERTIES}
echo "Exported variable WS_FLAGS."

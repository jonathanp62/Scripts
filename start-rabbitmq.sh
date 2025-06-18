#!/usr/bin/env bash

# @(#)renamer.sh	0.1.0	11/05/2021
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2020-11-05 09:29:13 -0500 (Thu, 05 Nov 2020) $
# @revision     $LastChangedRevision: 13143 $
#
# Usage:
#       start-rabbitmq.sh
#
# Use Ctrl-C to stop.
#
# To start as a background service: brew services start rabbitmq
# To connect to the management panel: http://localhost:15672

/usr/local/opt/rabbitmq/sbin/rabbitmq-server

exit 0

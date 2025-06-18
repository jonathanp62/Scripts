#!/usr/bin/env bash

# @(#)ebooks-imported0yesterday.sh	0.1.0	09/03/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2015-09-04 14:59:34 -0400 (Fri, 04 Sep 2015) $
# @revision     $LastChangedRevision: 2998 $
#
# Usage:
#       ebooks-imported0yesterday.sh

sqlplus -S teamsadm/teamsadm@//orateamspdb.us.randomhouse.com:1521/otmm7p @${HOME}/SQL/ebooks-imported-yesterday.sql

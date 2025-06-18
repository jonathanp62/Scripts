#!/usr/bin/env zsh

# @(#)s3-copy-files-to-bucket.sh	0.1.0	06/27/2020
#
# Copyright (c) Penguin Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $

# Usage:
#       s3-copy-files-to-bucket.sh

DEST_BUCKET=9bc25a69caac3a-archives
SOURCE_DIR=${HOME}/Archives

cd ${SOURCE_DIR}

for SOURCE_FILE in *
do
	aws s3 cp "${SOURCE_FILE}" s3://${DEST_BUCKET}
done

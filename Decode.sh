#!/usr/bin/env bash

# @(#)Decode.sh	1.0.3	06/02/2015
# @(#)Decode.sh	1.0.2	05/24/2015
# @(#)Decode.sh	1.0.1	05/19/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        1.0.1
# @version      1.0.3
# @updated      $LastChangedDate: 2015-06-02 14:00:22 -0400 (Tue, 02 Jun 2015) $
# @revision     $LastChangedRevision: 2538 $
#
# Usage:
#	Decode.sh <encoded-text> [iterations]

CLASSPATH=\
"${HOME}/NetBeans-Applications/base64-decoder-1.0.3.jar:\
${HOME}/NetBeans-Libraries/Commons Codec/commons-codec-1.7.jar"

CLASSNAME=com.rh.util.base64.decoder.Main
CHARSET=ISO-8859-1

java -cp "${CLASSPATH}" -Dapp.base64.charset.name=${CHARSET} ${CLASSNAME} "$@"

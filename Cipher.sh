#!/usr/bin/env bash

# @(#)Cipher.sh	0.1.1	02/03/2016
# @(#)Cipher.sh	0.1.0	01/28/2016
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2016-02-09 07:48:31 -0500 (Tue, 09 Feb 2016) $
# @revision     $LastChangedRevision: 3672 $
#
# Usage:
#	Cipher.sh <keystore> <keystore-password> <alias> <alias-password> <plain-text-phrase>

CLASSPATH=\
"${HOME}/NetBeans-Applications/java-crypto-0.1.1.jar:\
${HOME}/NetBeans-Libraries/Commons Codec/commons-codec-1.10.jar"

CLASSNAME=net.jonathan.demo.java.crypto.Main

java -cp "${CLASSPATH}" ${CLASSNAME} "$@"

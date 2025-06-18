#!/usr/bin/env bash

# @(#)Encrypt.sh	0.1.1	06/02/2015
# @(#)Encrypt.sh	0.1.0	05/19/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-06-02 14:00:22 -0400 (Tue, 02 Jun 2015) $
# @revision     $LastChangedRevision: 2538 $
#
# Usage:
#	Encrypt.sh create-password <plain-text-passphrase>
#	Encrypt.sh encrypt-text <plain-text> <password>
#	Encrypt.sh decrypt-text <encrypted-text> <password>

CLASSPATH=\
${HOME}/NetBeans-Applications/basic-encryptor-0.1.1.jar:\
${HOME}/NetBeans-Libraries/jasypt-1.9.2/lib/icu4j-3.4.4.jar:\
${HOME}/NetBeans-Libraries/jasypt-1.9.2/lib/jasypt-1.9.2.jar

CLASSNAME=net.jonathan.secure.util.basicencryptor.Main

java -cp ${CLASSPATH} ${CLASSNAME} "$@"

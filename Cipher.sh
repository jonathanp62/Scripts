#!/usr/bin/env bash

# @(#)Cipher.sh	0.1.1	02/03/2016
# @(#)Cipher.sh	0.1.0	01/28/2016
#
# MIT License
#
# Copyright (c) 2026 Jonathan M. Parker
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
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

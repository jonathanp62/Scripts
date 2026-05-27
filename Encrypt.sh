#!/usr/bin/env bash

# @(#)Encrypt.sh	0.1.1	06/02/2015
# @(#)Encrypt.sh	0.1.0	05/19/2015
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

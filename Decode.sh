#!/usr/bin/env bash

# @(#)Decode.sh	1.0.3	06/02/2015
# @(#)Decode.sh	1.0.2	05/24/2015
# @(#)Decode.sh	1.0.1	05/19/2015
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

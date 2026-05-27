#!/usr/bin/env bash

# @(#)Run-Password-Generator.sh	1.0.1	05/19/2015
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
# @version      1.0.1
# @updated      $LastChangedDate: 2015-05-19 13:07:06 -0400 (Tue, 19 May 2015) $
# @revision     $LastChangedRevision: 2526 $
#
# Usage:
#	Run-Password-Generator.sh [-signs|+signs] [-len <nn>]

if [ "$#" -gt 3 ]
then
        echo "Usage: ${0} [-signs|+signs] [-len nn]"
        exit 1
fi

JAVA_CLASSPATH=${HOME}/NetBeans-Applications/Password-Generator.jar
JAVA_CLASS_NAME=com.rh.util.password.generator.Main

java -classpath ${JAVA_CLASSPATH} ${JAVA_CLASS_NAME} ${1} ${2} ${3}

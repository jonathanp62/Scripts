#!/usr/bin/env bash

# @(#)View-Manifest.sh	0.1.0	03/31/2014
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
# @version      0.1.0
# @updated      $LastChangedDate: 2014-07-20 14:24:58 -0400 (Sun, 20 Jul 2014) $
# @revision     $LastChangedRevision: 1474 $

# Usage:
#       View-Manifest.sh <jar-name>

if [ "$#" -eq 0 ]
then
        echo "Usage: $0 <jar-name>"
        exit 1
fi

unzip -q -c ${1} META-INF/MANIFEST.MF

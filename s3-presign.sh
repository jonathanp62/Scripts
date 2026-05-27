#!/usr/bin/env zsh

# @(#)s3-presign.sh	0.1.0	07/22/2020
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
# @updated      $LastChangedDate: 2020-09-12 08:37:48 -0400 (Sat, 12 Sep 2020) $
# @revision     $LastChangedRevision: 12928 $

# Usage:
#       s3-presign.sh <bucket-name> <key-name> [expires]
#
# Note: The default value for expires (in seconds) is 3600 (one hour).

if [ "$#" -ne 2 ] && [ "$#" -ne 3 ]
then
        echo "Usage: $0 <bucket-name> <key-name> [expires]"
        exit 1
fi

PROFILE=s3-read-only
BUCKET=${1}
KEY=${2}

if [ "$#" -eq 3 ]
then
	EXPIRES=${3}
else
	EXPIRES=
fi

if [ -z ${EXPIRES} ]
then
	aws s3 presign s3://${BUCKET}/${KEY} --profile ${PROFILE}
else
	aws s3 presign s3://${BUCKET}/${KEY} --expires-in ${EXPIRES} --profile ${PROFILE}
fi

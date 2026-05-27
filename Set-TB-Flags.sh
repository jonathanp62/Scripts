#!/usr/bin/env bash

# @(#)Set-TB-Flags.sh	0.1.1	07/25/2014
# @(#)Set-TB-Flags.sh	0.1.0	07/16/2014
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
# @updated      $LastChangedDate: 2014-07-25 10:59:47 -0400 (Fri, 25 Jul 2014) $
# @revision     $LastChangedRevision: 1505 $

# Usage:
#       . ./Set-TB-Flags.sh

PROPERTIES="\
-Dtastebook.search.solr.enabled=false \
-Dtastebook.solr.messagequeue.enabled=false \
-Dlogging.log4j.logger.tastebook.fetch=trace \
-Dlogging.log4j.logger.tastebook.parser=trace\
"

echo "Setting the following properties for TB WS..."
echo ${PROPERTIES}

export WS_FLAGS=${PROPERTIES}
echo "Exported variable WS_FLAGS."

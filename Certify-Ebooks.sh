#!/usr/bin/env bash

# @(#)Certify-Ebooks.sh	0.1.0	09/03/2015
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
# @updated      $LastChangedDate: 2015-09-04 14:59:34 -0400 (Fri, 04 Sep 2015) $
# @revision     $LastChangedRevision: 2998 $
#
# Usage:
#       Certify-Ebooks.sh

SCRIPT_HOME=${HOME}/Scripts
APP_HOME=/usr/local/booxtream-certifier
LIST_FILE=temp/ebook-isbn-list.txt

echo "Proceeding to certify eBooks imported yesterday through BooxTream..."

rm ${APP_HOME}/${LIST_FILE} 2>/dev/null

echo "Obtaining the list of eBook ISBNs imported yesterday..."

${SCRIPT_HOME}/ebooks-imported-yesterday.sh > ${APP_HOME}/${LIST_FILE}

cd ${APP_HOME}/bin

echo "Starting the BooxTream Certifier command line utility..."

${APP_HOME}/bin/run-file.sh ${APP_HOME}/${LIST_FILE}

echo "The BooxTream Certifier service is now running. Check the log files and certifications table for results."

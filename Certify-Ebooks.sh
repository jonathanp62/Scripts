#!/usr/bin/env bash

# @(#)Certify-Ebooks.sh	0.1.0	09/03/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
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

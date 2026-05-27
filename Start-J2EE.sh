#!/usr/bin/env bash

# @(#)Start-J2EE.sh	0.1.1	09/01/2015
# @(#)Start-J2EE.sh	0.1.0	01/02/2015
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
# @updated      $LastChangedDate: 2015-09-01 11:52:17 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2988 $
#
# Usage:
#       Start-J2EE.sh [optional-configuration-file-path]

SCRIPT_HOME=${HOME}/Scripts
COLORS_FILE=${HOME}/Config/Colors.cfg

echo "INFO: Using colors file ${COLORS_FILE}..."

source ${COLORS_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source colors file ${COLORS_FILE}."
	exit 1
fi

${SCRIPT_HOME}/Start-MySQL.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_red_light}ERROR: MySQL did not start.${color_off}"
	exit 1
fi

${SCRIPT_HOME}/Start-ActiveMQ.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_red_light}ERROR: ActiveMQ did not start.${color_off}"
	exit 1
fi

${SCRIPT_HOME}/Start-JBoss.sh

if [ "$?" -ne 0 ]; then
	echo -e "${color_red_light}ERROR: JBoss did not start.${color_off}"
	exit 1
fi

exit 0

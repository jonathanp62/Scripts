#!/usr/bin/env bash

# @(#)Antlr-Tool.sh	0.1.2	08/26/2015
# @(#)Antlr-Tool.sh	0.1.1	08/14/2015
# @(#)Antlr-Tool.sh	0.1.0	08/13/2015
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
# @version      0.1.2
# @updated      $LastChangedDate: 2015-09-01 11:52:17 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2988 $
#
# Usage:
#	Antlr-Tool.sh <argument> <argument> ... 
#
#	Take care to run this script only inside an Antlr project directory with one or more grammars as it will delete files.

COLORS_FILE=${HOME}/Config/Colors.cfg
CONFIG_FILE=${HOME}/Config/Antlr.cfg

echo "INFO: Using configuration file ${CONFIG_FILE}..."
echo "INFO: Using colors file ${COLORS_FILE}..."

source ${COLORS_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source colors file ${COLORS_FILE}."
	exit 1
fi

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo -e "${color_red_light}ERROR: Unable to source configuration file ${CONFIG_FILE}.${color_off}"
	exit 1
fi

if [ -z "${antlr_lib}" ]
then
        echo -e "${color_red_light}ERROR: Variable antlr_lib was not found in the configuration file ${CONFIG_FILE}.${color_off}"
        exit 1
fi

# Clean out previously generated sources

rm *.class  2> /dev/null
rm *.java   2> /dev/null
rm *.tokens 2> /dev/null

ANTLR_LIB=${antlr_lib}

CLASSPATH=\
${ANTLR_LIB}

CLASSNAME=org.antlr.v4.Tool

java -cp ${CLASSPATH} ${CLASSNAME} "$@"

if [ "$?" -eq 0 ]
then
	if [ ! -z "`ls *.java 2> /dev/null`" ]
	then
		echo "Compiling generated Java source files..."
		javac -cp ${CLASSPATH} *.java
	else
		echo "No Java sources to compile"
	fi
fi

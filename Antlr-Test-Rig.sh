#!/usr/bin/env bash

# @(#)Antlr-Test-Rig.sh	0.1.2	08/26/2015
# @(#)Antlr-Test-Rig.sh	0.1.1	08/14/2015
# @(#)Antlr-Test-Rig.sh	0.1.0	08/13/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.2
# @updated      $LastChangedDate: 2015-09-01 11:52:17 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2988 $
#
# Usage:
#	Antlr-Test-Rig.sh <argument> <argument> ... 
#
#	Compile the lexer and parser source files before running the test rig
#	<Enter> the input desired
#	<Ctl-D> to terminate reading from standard input

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

ANTLR_LIB=${antlr_lib}

CLASSPATH=\
.:\
${ANTLR_LIB}

CLASSNAME=org.antlr.v4.gui.TestRig

java -cp ${CLASSPATH} ${CLASSNAME} "$@"

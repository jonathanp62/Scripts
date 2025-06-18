#!/usr/bin/env bash

# @(#)convert-penguin-mp3s.sh	0.1.3	09/01/2015
# @(#)convert-penguin-mp3s.sh	0.1.2	08/26/2015
# @(#)convert-penguin-mp3s.sh	0.1.1	06/27/2014
# @(#)convert-penguin-mp3s.sh	0.1.0	06/25/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.3
# @updated      $LastChangedDate: 2015-09-01 12:15:29 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2989 $

# Usage:
#       convert-penguin-mp3s.sh [optional-configuration-file-path]

if [ "$#" -eq 0 ]
then
	CONFIG_FILE=${HOME}/Config/convert-penguin-mp3s.cfg
else
	CONFIG_FILE=${1}
fi

echo "INFO: Using configuration file ${CONFIG_FILE}..."

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${convert_perl_home}" ]
then
	echo "ERROR: Variable convert_perl_home was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${mp3_directory}" ]
then
	echo "ERROR: Variable mp3_directory was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${wav_directory}" ]
then
	echo "ERROR: Variable wav_directory was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

PERL_HOME=${convert_perl_home}
MP3_DIR=${mp3_directory}
WAV_DIR=${wav_directory}

echo "INFO: Sourced Perl home directory: ${PERL_HOME}"
echo "INFO: Sourced MP3 directory: ${MP3_DIR}"
echo "INFO: Sourced WAV directory: ${WAV_DIR}"

${PERL_HOME}/convert-penguin-mp3s.pl ${MP3_DIR} ${WAV_DIR}

if [ "$?" -ne 0 ]
then
	echo "ERROR: ${PERL_HOME}/convert-penguin-mp3s.pl did not complete normally."
	exit 1
fi

echo "INFO: ${PERL_HOME}/convert-penguin-mp3s.pl completed normally."

exit 0

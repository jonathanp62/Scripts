#!/usr/bin/env bash

# @(#)mp3-to-wav.sh	0.1.3	08/26/2015
# @(#)mp3-to-wav.sh	0.1.2	07/15/2014
# @(#)mp3-to-wav.sh	0.1.1	07/09/2014
# @(#)mp3-to-wav.sh	0.1.0	06/19/2014
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
# @version      0.1.3
# @updated      $LastChangedDate: 2015-09-03 10:45:21 -0400 (Thu, 03 Sep 2015) $
# @revision     $LastChangedRevision: 2996 $

# Usage:
#       mp3-to-wav.sh <mp3-name> [optional-wav-output-directory] [optional-configuration-file-path]

if [ "$#" -eq 0 ] || [ "$#" -gt 3 ]
then
        echo "Usage: $0 <mp3-name> [optional-wav-output-directory] [optional-configuration-file-path]"
        exit 1
fi

# Determine the default configuration file based on the OS

case "`uname`" in
        "Darwin") echo "INFO: Running on Mac OS X."
                  DEFAULT_CONFIG=${HOME}/Config/mp3-wav-darwin.cfg
                  ;;
        "Linux")  echo "INFO: Running on Linux."
                  DEFAULT_CONFIG=${HOME}/mp3-wav-linux.cfg	# @todo Requires update upon deployment
                  ;;
        "SunOS")  echo "INFO: Running on Solaris."
                  DEFAULT_CONFIG=${HOME}/mp3-wav-sunos.cfg	# @todo Requires update upon deployment
                  ;;
        *)        echo "ERROR: Unsupported OS."
                  exit 1
                  ;;
esac

# Handle the command line arguments

if [ "$#" -eq 1 ]
then
	INPUT_FILE=${1}
	CONFIG_FILE=${DEFAULT_CONFIG}
elif [ "$#" -eq 2 ]
then
	INPUT_FILE=${1}
	CONFIG_FILE=${DEFAULT_CONFIG}
	OUTPUT_DIR=${2}
elif [ "$#" -eq 3 ]
then
	INPUT_FILE=${1}
	CONFIG_FILE=${3}
	OUTPUT_DIR=${2}
else
	echo "ERROR: Unexpected number of command line arguments"
	exit 1
fi

echo "INFO: Using configuration file ${CONFIG_FILE}..."

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${ffmpeg_home}" ]
then
	echo "ERROR: Variable ffmpeg_home was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${ffmpeg_stats}" ]
then
	echo "ERROR: Variable ffmpeg_stats was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${file_flags}" ]
then
	echo "ERROR: Variable file_flags was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${mp3_file_extension}" ]
then
	echo "ERROR: Variable mp3_file_extension was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${wav_file_extension}" ]
then
	echo "ERROR: Variable wav_file_extension was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${wav_sampling_rate}" ]
then
	echo "ERROR: Variable wav_sampling_rate was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${wav_audio_channels}" ]
then
	echo "ERROR: Variable wav_audio_channels was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${wav_bit_rate}" ]
then
	echo "ERROR: Variable wav_bit_rate was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${mp3_mime_type}" ]
then
	echo "ERROR: Variable mp3_mime_type was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

if [ -z "${volume_adjust}" ]
then
	echo "ERROR: Variable volume_adjust was not found in the configuration file ${CONFIG_FILE}."
	exit 1
fi

FFMPEG_HOME=${ffmpeg_home}
FFMPEG_STATS=${ffmpeg_stats}
FILE_FLAGS=${file_flags}
MP3_EXTENSION=${mp3_file_extension}
MP3_MIME_TYPE=${mp3_mime_type}
WAV_EXTENSION=${wav_file_extension}
SAMPLING_RATE=${wav_sampling_rate}
AUDIO_CHANNELS=${wav_audio_channels}
BIT_RATE=${wav_bit_rate}
VOLUME_ADJUST=${volume_adjust}
TMP_OUTPUT_FILE=tmp${RANDOM}.${WAV_EXTENSION}

if [ ! -z "${OUTPUT_DIR}" ]
then
	FINAL_OUTPUT_FILE=${OUTPUT_DIR}/`basename ${INPUT_FILE} .${MP3_EXTENSION}`.${WAV_EXTENSION}
else
	FINAL_OUTPUT_FILE=`basename ${INPUT_FILE} .${MP3_EXTENSION}`.${WAV_EXTENSION}
fi

echo "INFO: Checking that ${INPUT_FILE} is an MP3 file..."

if [ ! -f ${INPUT_FILE} ]
then
	echo "ERROR: Input file ${INPUT_FILE} is not defined as a regular file."
	exit 1
fi

MIME_TYPE=`file ${FILE_FLAGS} ${INPUT_FILE} | awk '{print $2}'`

echo "INFO: ${INPUT_FILE} has a mime type of ${MIME_TYPE}."

if [ "${MIME_TYPE}" != "${MP3_MIME_TYPE}" ]
then
	echo "ERROR: ${INPUT_FILE} is not an MP3 file."
	exit 1
fi

# Create the array of arguments for FFmpeg

ARG_ARRAY=( "-i" "${INPUT_FILE}" )

if [[ "${FFMPEG_STATS}" != "true" && "${FFMPEG_STATS}" != "yes" ]]
then
	ARG_ARRAY=( "${ARG_ARRAY[@]}" "-nostats" )
fi

ARG_ARRAY=( "${ARG_ARRAY[@]}" "-vn" "-ar" "${SAMPLING_RATE}" "-ac" "${AUDIO_CHANNELS}" "-y" "-ab" "${BIT_RATE}" )

if [[ "${volume_adjust}" != "0dB" && "${volume_adjust}" != "+0dB" && "${volume_adjust}" != "-0dB" ]]
then
	ARG_ARRAY=( "${ARG_ARRAY[@]}" "-af" "volume=${volume_adjust}" )
fi

ARG_ARRAY=( "${ARG_ARRAY[@]}" "-f" "wav" "${TMP_OUTPUT_FILE}" )

echo "INFO: FFmpeg arguments: ${ARG_ARRAY[@]}"

# Invoke FFmpeg

echo "INFO: Begin converting ${INPUT_FILE} to ${TMP_OUTPUT_FILE}..."

${FFMPEG_HOME}/ffmpeg "${ARG_ARRAY[@]}"

if [ "$?" -ne 0 ]
then
	echo "ERROR: ffmpeg failed to convert file ${INPUT_FILE}."
	exit 1
fi

echo "INFO: Done converting ${INPUT_FILE} to ${TMP_OUTPUT_FILE}."

mv ${TMP_OUTPUT_FILE} ${FINAL_OUTPUT_FILE}

if [ "$?" -ne 0 ]
then
	echo "ERROR: Failed to move ${TMP_OUTPUT_FILE} to ${FINAL_OUTPUT_FILE}."
	exit 1
fi

echo "INFO: Completed renaming ${TMP_OUTPUT_FILE} to ${FINAL_OUTPUT_FILE}."

exit 0

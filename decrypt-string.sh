#!/usr/bin/env zsh

# @(#)decrypt-string.sh 	1.0.0   07/25/2024
#
# @author       Jonathan Parker
# @version      1.0.0
# @since        1.0.0
#
# Usage:
#       encrypt-string.sh <options...>
#
# MIT License
#
# Copyright (c) 2024 Jonathan M. Parker
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

if [ "$#" -eq 1 ]
then
        STRING=${1}
else
        echo "Expected one string argument: decrypt-string.sh <string-to-decrypt>"
        exit 1
fi

CONFIG_FILE=${HOME}/Config/AES256.cfg

echo "Using configuration file ${CONFIG_FILE}..."

source ${CONFIG_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "Unable to source configuration file ${CONFIG_FILE}"
	exit 1
fi

if [ -z "${aes256_home}" ]
then
        echo "Variable aes256_home was not found in the configuration file ${CONFIG_FILE}"
        exit 1
fi

if [ -z "${aes256_user}" ]
then
        echo "Variable aes256_user was not found in the configuration file ${CONFIG_FILE}"
        exit 1
fi

${aes256_home}/bin/decrypt.sh --string ${STRING} --user ${aes256_user}

exit 0

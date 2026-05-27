#!/usr/bin/env bash

# @(#)speed-up-time-machine.sh	0.1.1	07/29/2022
# @(#)speed-up-time-machine.sh	0.1.0	05/23/2022
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
# @updated      $LastChangedDate: 2020-11-05 09:29:13 -0500 (Thu, 05 Nov 2020) $
# @revision     $LastChangedRevision: 13143 $
#
# Usage:
#       speed-up-time-machine.sh <on|off>

if [ "$#" -eq 0 ]
then
        echo "Usage: ${0} <on|off>"
        exit 1
fi

if [ ${1} = "on" ]
then
	VALUE=0
elif [ ${1} = "off" ]
then
	VALUE=1
else
    echo "Usage: $0 <on|off>"
    exit 1
fi

sudo sysctl debug.lowpri_throttle_enabled=${VALUE}

if [ ${1} = "on" ]
then
	echo "INFO: The low priority throttle has been disabled"
else
	echo "INFO: The low priority throttle has been enabled"
fi

exit 0

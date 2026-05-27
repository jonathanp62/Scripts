#!/usr/bin/env bash

# @(#)Link-Mavericks-Desktop.sh	0.1.0	09/04/2015
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
#       Link-Mavericks-Desktop.sh

APPLE_DIR="/Library/Desktop Pictures"
MY_DIR="${HOME}/Pictures/My Desktops/Mavericks"

echo "Begin linking my Mavericks desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}..."

sudo ln -s "${MY_DIR}/Abstract.jpg" "${APPLE_DIR}/Abstract.jpg"
sudo ln -s "${MY_DIR}/Death Valley.jpg" "${APPLE_DIR}/Death Valley.jpg"
sudo ln -s "${MY_DIR}/Desert.jpg" "${APPLE_DIR}/Desert.jpg"
sudo ln -s "${MY_DIR}/Foggy Forest.jpg" "${APPLE_DIR}/Foggy Forest.jpg"
sudo ln -s "${MY_DIR}/Foxtail Barley.jpg" "${APPLE_DIR}/Foxtail Barley.jpg"
sudo ln -s "${MY_DIR}/Grass Blades.jpg" "${APPLE_DIR}/Grass Blades.jpg"
sudo ln -s "${MY_DIR}/Mountain Range.jpg" "${APPLE_DIR}/Mountain Range.jpg"
sudo ln -s "${MY_DIR}/Mt. Fuji.jpg" "${APPLE_DIR}/Mt. Fuji.jpg"
sudo ln -s "${MY_DIR}/Rolling Waves.jpg" "${APPLE_DIR}/Rolling Waves.jpg"
sudo ln -s "${MY_DIR}/Underwater.jpg" "${APPLE_DIR}/Underwater.jpg"
sudo ln -s "${MY_DIR}/Wave.jpg" "${APPLE_DIR}/Wave.jpg"

echo "Done linking my Mavericks desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}."
exit 0

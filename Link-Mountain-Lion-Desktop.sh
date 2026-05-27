#!/usr/bin/env bash

# @(#)Link-Mountain-Lion-Desktop.sh	0.1.0	09/04/2015
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
#       Link-Mountain-Lion-Desktop.sh

APPLE_DIR="/Library/Desktop Pictures"
MY_DIR="${HOME}/Pictures/My Desktops/Mountain Lion"

echo "Begin linking my Mountain Lion desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}..."

sudo ln -s "${MY_DIR}/Antelope Canyon.jpg" "${APPLE_DIR}/Antelope Canyon.jpg"
sudo ln -s "${MY_DIR}/Bahamas Aerial.jpg" "${APPLE_DIR}/Bahamas Aerial.jpg"
sudo ln -s "${MY_DIR}/Blue Pond.jpg" "${APPLE_DIR}/Blue Pond.jpg"
sudo ln -s "${MY_DIR}/Brushes.jpg" "${APPLE_DIR}/Brushes.jpg"
sudo ln -s "${MY_DIR}/Circles.jpg" "${APPLE_DIR}/Circles.jpg"
sudo ln -s "${MY_DIR}/Earth and Moon.jpg" "${APPLE_DIR}/Earth and Moon.jpg"
sudo ln -s "${MY_DIR}/Earth Horizon.jpg" "${APPLE_DIR}/Earth Horizon.jpg"
sudo ln -s "${MY_DIR}/Floating Ice.jpg" "${APPLE_DIR}/Floating Ice.jpg"
sudo ln -s "${MY_DIR}/Frog.jpg" "${APPLE_DIR}/Frog.jpg"
sudo ln -s "${MY_DIR}/Galaxy.jpg" "${APPLE_DIR}/Galaxy.jpg"
sudo ln -s "${MY_DIR}/Hawaiian Print.jpg" "${APPLE_DIR}/Hawaiian Print.jpg"
sudo ln -s "${MY_DIR}/Milky Way.jpg" "${APPLE_DIR}/Milky Way.jpg"
sudo ln -s "${MY_DIR}/Rice Paddy.jpg" "${APPLE_DIR}/Rice Paddy.jpg"
sudo ln -s "${MY_DIR}/Shapes.jpg" "${APPLE_DIR}/Shapes.jpg"
sudo ln -s "${MY_DIR}/Sky.jpg" "${APPLE_DIR}/Sky.jpg"
sudo ln -s "${MY_DIR}/Snow.jpg" "${APPLE_DIR}/Snow.jpg"
sudo ln -s "${MY_DIR}/Zebras.jpg" "${APPLE_DIR}/Zebras.jpg"

echo "Done linking my Mountain Lion desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}."
exit 0

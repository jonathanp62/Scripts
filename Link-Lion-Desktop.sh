#!/usr/bin/env bash

# @(#)Link-Lion-Desktop.sh	0.1.0	09/04/2015
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
#       Link-Lion-Desktop.sh

APPLE_DIR="/Library/Desktop Pictures"
MY_DIR="${HOME}/Pictures/My Desktops/Lion"

echo "Begin linking my Lion desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}..."

sudo ln -s "${MY_DIR}/Beach.jpg" "${APPLE_DIR}/Beach.jpg"
sudo ln -s "${MY_DIR}/Bristle Grass.jpg" "${APPLE_DIR}/Bristle Grass.jpg"
sudo ln -s "${MY_DIR}/Ducks on a Misty Pond.jpg" "${APPLE_DIR}/Ducks on a Misty Pond.jpg"
sudo ln -s "${MY_DIR}/Eagle & Waterfall.jpg" "${APPLE_DIR}/Eagle & Waterfall.jpg"
sudo ln -s "${MY_DIR}/Elephant.jpg" "${APPLE_DIR}/Elephant.jpg"
sudo ln -s "${MY_DIR}/Flamingos.jpg" "${APPLE_DIR}/Flamingos.jpg"
sudo ln -s "${MY_DIR}/Floating Leaves.jpg" "${APPLE_DIR}/Floating Leaves.jpg"
sudo ln -s "${MY_DIR}/Forest in Mist.jpg" "${APPLE_DIR}/Forest in Mist.jpg"
sudo ln -s "${MY_DIR}/Isles.jpg" "${APPLE_DIR}/Isles.jpg"
sudo ln -s "${MY_DIR}/Lake.jpg" "${APPLE_DIR}/Lake.jpg"
sudo ln -s "${MY_DIR}/Lion.jpg" "${APPLE_DIR}/Lion.jpg"
sudo ln -s "${MY_DIR}/Moon.jpg" "${APPLE_DIR}/Moon.jpg"
sudo ln -s "${MY_DIR}/Pink Forest.jpg" "${APPLE_DIR}/Pink Forest.jpg"
sudo ln -s "${MY_DIR}/Pink Lotus Flower.jpg" "${APPLE_DIR}/Pink Lotus Flower.jpg"
sudo ln -s "${MY_DIR}/Poppies.jpg" "${APPLE_DIR}/Poppies.jpg"
sudo ln -s "${MY_DIR}/Red Bells.jpg" "${APPLE_DIR}/Red Bells.jpg"

echo "Done linking my Lion desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}."
exit 0

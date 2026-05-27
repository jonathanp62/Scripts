#!/usr/bin/env bash

# @(#)Link-Mountain-Lion-Screensavers.sh	0.1.0	09/04/2015
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
#       Link-Mountain-Lion-Screensavers.sh

APPLE_DIR="/Library/Desktop Pictures"
MY_DIR="${HOME}/Pictures/Mountain Lion Screensavers"

echo "Begin linking my Mountain Lion screensaver images in ${MY_DIR} to the Apple set in ${APPLE_DIR}..."

sudo ln -s "${MY_DIR}/Aerial01.jpg" "${APPLE_DIR}/Aerial01.jpg"
sudo ln -s "${MY_DIR}/Aerial02.jpg" "${APPLE_DIR}/Aerial02.jpg"
sudo ln -s "${MY_DIR}/Aerial03.jpg" "${APPLE_DIR}/Aerial03.jpg"
sudo ln -s "${MY_DIR}/Aerial04.jpg" "${APPLE_DIR}/Aerial04.jpg"
sudo ln -s "${MY_DIR}/Aerial05.jpg" "${APPLE_DIR}/Aerial05.jpg"
sudo ln -s "${MY_DIR}/Aerial06.jpg" "${APPLE_DIR}/Aerial06.jpg"
sudo ln -s "${MY_DIR}/Aerial07.jpg" "${APPLE_DIR}/Aerial07.jpg"
sudo ln -s "${MY_DIR}/Aerial08.jpg" "${APPLE_DIR}/Aerial08.jpg"
sudo ln -s "${MY_DIR}/Aerial09.jpg" "${APPLE_DIR}/Aerial09.jpg"
sudo ln -s "${MY_DIR}/Cosmos01.jpg" "${APPLE_DIR}/Cosmos01.jpg"
sudo ln -s "${MY_DIR}/Cosmos02.jpg" "${APPLE_DIR}/Cosmos02.jpg"
sudo ln -s "${MY_DIR}/Cosmos03.jpg" "${APPLE_DIR}/Cosmos03.jpg"
sudo ln -s "${MY_DIR}/Cosmos04.jpg" "${APPLE_DIR}/Cosmos04.jpg"
sudo ln -s "${MY_DIR}/Cosmos05.jpg" "${APPLE_DIR}/Cosmos05.jpg"
sudo ln -s "${MY_DIR}/Cosmos06.jpg" "${APPLE_DIR}/Cosmos06.jpg"
sudo ln -s "${MY_DIR}/Cosmos07.jpg" "${APPLE_DIR}/Cosmos07.jpg"
sudo ln -s "${MY_DIR}/Cosmos08.jpg" "${APPLE_DIR}/Cosmos08.jpg"
sudo ln -s "${MY_DIR}/Cosmos09.jpg" "${APPLE_DIR}/Cosmos09.jpg"
sudo ln -s "${MY_DIR}/NatGeo01.jpg" "${APPLE_DIR}/NatGeo01.jpg"
sudo ln -s "${MY_DIR}/NatGeo02.jpg" "${APPLE_DIR}/NatGeo02.jpg"
sudo ln -s "${MY_DIR}/NatGeo03.jpg" "${APPLE_DIR}/NatGeo03.jpg"
sudo ln -s "${MY_DIR}/NatGeo04.jpg" "${APPLE_DIR}/NatGeo04.jpg"
sudo ln -s "${MY_DIR}/NatGeo05.jpg" "${APPLE_DIR}/NatGeo05.jpg"
sudo ln -s "${MY_DIR}/NatGeo06.jpg" "${APPLE_DIR}/NatGeo06.jpg"
sudo ln -s "${MY_DIR}/NatGeo07.jpg" "${APPLE_DIR}/NatGeo07.jpg"
sudo ln -s "${MY_DIR}/NatGeo08.jpg" "${APPLE_DIR}/NatGeo08.jpg"
sudo ln -s "${MY_DIR}/NatGeo09.jpg" "${APPLE_DIR}/NatGeo09.jpg"
sudo ln -s "${MY_DIR}/NatGeo10.jpg" "${APPLE_DIR}/NatGeo10.jpg"
sudo ln -s "${MY_DIR}/NatGeo11.jpg" "${APPLE_DIR}/NatGeo11.jpg"
sudo ln -s "${MY_DIR}/NatGeo12.jpg" "${APPLE_DIR}/NatGeo12.jpg"
sudo ln -s "${MY_DIR}/NatGeo13.jpg" "${APPLE_DIR}/NatGeo13.jpg"
sudo ln -s "${MY_DIR}/NatGeo14.jpg" "${APPLE_DIR}/NatGeo14.jpg"
sudo ln -s "${MY_DIR}/NatGeo15.jpg" "${APPLE_DIR}/NatGeo15.jpg"
sudo ln -s "${MY_DIR}/NatGeo16.jpg" "${APPLE_DIR}/NatGeo16.jpg"
sudo ln -s "${MY_DIR}/NatGeo17.jpg" "${APPLE_DIR}/NatGeo17.jpg"
sudo ln -s "${MY_DIR}/NaturePatterns01.jpg" "${APPLE_DIR}/NaturePatterns01.jpg"
sudo ln -s "${MY_DIR}/NaturePatterns02.jpg" "${APPLE_DIR}/NaturePatterns02.jpg"
sudo ln -s "${MY_DIR}/NaturePatterns03.jpg" "${APPLE_DIR}/NaturePatterns03.jpg"
sudo ln -s "${MY_DIR}/NaturePatterns04.jpg" "${APPLE_DIR}/NaturePatterns04.jpg"
sudo ln -s "${MY_DIR}/NaturePatterns05.jpg" "${APPLE_DIR}/NaturePatterns05.jpg"
sudo ln -s "${MY_DIR}/NaturePatterns06.jpg" "${APPLE_DIR}/NaturePatterns06.jpg"
sudo ln -s "${MY_DIR}/NaturePatterns07.jpg" "${APPLE_DIR}/NaturePatterns07.jpg"
sudo ln -s "${MY_DIR}/NaturePatterns08.jpg" "${APPLE_DIR}/NaturePatterns08.jpg"

echo "Done linking my Mountain Lion screensaver images in ${MY_DIR} to the Apple set in ${APPLE_DIR}."
exit 0

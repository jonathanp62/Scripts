#!/usr/bin/env bash

# @(#)Link-Windows7-Desktops.sh	0.1.0	09/04/2015
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2015-09-04 14:59:34 -0400 (Fri, 04 Sep 2015) $
# @revision     $LastChangedRevision: 2998 $
#
# Usage:
#       Link-Windows7-Desktops.sh

APPLE_DIR="/Library/Desktop Pictures"
MY_DIR="${HOME}/Pictures/My Desktops/Windows-7"

echo "Begin linking my Windows 7 desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}..."

sudo ln -s "${MY_DIR}/win7-img1.jpg" "${APPLE_DIR}/win7-img1.jpg"
sudo ln -s "${MY_DIR}/win7-img2.jpg" "${APPLE_DIR}/win7-img2.jpg"
sudo ln -s "${MY_DIR}/win7-img3.jpg" "${APPLE_DIR}/win7-img3.jpg"
sudo ln -s "${MY_DIR}/win7-img4.jpg" "${APPLE_DIR}/win7-img4.jpg"
sudo ln -s "${MY_DIR}/win7-img5.jpg" "${APPLE_DIR}/win7-img5.jpg"
sudo ln -s "${MY_DIR}/win7-img6.jpg" "${APPLE_DIR}/win7-img6.jpg"
sudo ln -s "${MY_DIR}/win7-img7.jpg" "${APPLE_DIR}/win7-img7.jpg"
sudo ln -s "${MY_DIR}/win7-img8.jpg" "${APPLE_DIR}/win7-img8.jpg"
sudo ln -s "${MY_DIR}/win7-img9.jpg" "${APPLE_DIR}/win7-img9.jpg"
sudo ln -s "${MY_DIR}/win7-img10.jpg" "${APPLE_DIR}/win7-img10.jpg"
sudo ln -s "${MY_DIR}/win7-img11.jpg" "${APPLE_DIR}/win7-img11.jpg"
sudo ln -s "${MY_DIR}/win7-img12.jpg" "${APPLE_DIR}/win7-img12.jpg"
sudo ln -s "${MY_DIR}/win7-img13.jpg" "${APPLE_DIR}/win7-img13.jpg"
sudo ln -s "${MY_DIR}/win7-img14.jpg" "${APPLE_DIR}/win7-img14.jpg"
sudo ln -s "${MY_DIR}/win7-img15.jpg" "${APPLE_DIR}/win7-img15.jpg"
sudo ln -s "${MY_DIR}/win7-img16.jpg" "${APPLE_DIR}/win7-img16.jpg"
sudo ln -s "${MY_DIR}/win7-img17.jpg" "${APPLE_DIR}/win7-img17.jpg"
sudo ln -s "${MY_DIR}/win7-img18.jpg" "${APPLE_DIR}/win7-img18.jpg"
sudo ln -s "${MY_DIR}/win7-img19.jpg" "${APPLE_DIR}/win7-img19.jpg"
sudo ln -s "${MY_DIR}/win7-img20.jpg" "${APPLE_DIR}/win7-img20.jpg"
sudo ln -s "${MY_DIR}/win7-img21.jpg" "${APPLE_DIR}/win7-img21.jpg"
sudo ln -s "${MY_DIR}/win7-img22.jpg" "${APPLE_DIR}/win7-img22.jpg"
sudo ln -s "${MY_DIR}/win7-img23.jpg" "${APPLE_DIR}/win7-img23.jpg"
sudo ln -s "${MY_DIR}/win7-img24.jpg" "${APPLE_DIR}/win7-img24.jpg"
sudo ln -s "${MY_DIR}/win7-img25.jpg" "${APPLE_DIR}/win7-img25.jpg"
sudo ln -s "${MY_DIR}/win7-img26.jpg" "${APPLE_DIR}/win7-img26.jpg"
sudo ln -s "${MY_DIR}/win7-img27.jpg" "${APPLE_DIR}/win7-img27.jpg"
sudo ln -s "${MY_DIR}/win7-img28.jpg" "${APPLE_DIR}/win7-img28.jpg"
sudo ln -s "${MY_DIR}/win7-img29.jpg" "${APPLE_DIR}/win7-img29.jpg"
sudo ln -s "${MY_DIR}/win7-img30.jpg" "${APPLE_DIR}/win7-img30.jpg"

echo "Done linking my Windows 7 desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}."
exit 0

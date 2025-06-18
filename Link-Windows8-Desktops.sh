#!/usr/bin/env bash

# @(#)Link-Windows8-Desktops.sh	0.1.0	09/04/2015
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
#       Link-Windows8-Desktops.sh

APPLE_DIR="/Library/Desktop Pictures"
MY_DIR="${HOME}/Pictures/My Desktops/Windows-8"

echo "Begin linking my Windows 8 desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}..."

sudo ln -s "${MY_DIR}/img0.jpg" "${APPLE_DIR}/img0.jpg"
sudo ln -s "${MY_DIR}/img1.jpg" "${APPLE_DIR}/img1.jpg"
sudo ln -s "${MY_DIR}/img2.jpg" "${APPLE_DIR}/img2.jpg"
sudo ln -s "${MY_DIR}/img3.jpg" "${APPLE_DIR}/img3.jpg"
sudo ln -s "${MY_DIR}/img4.jpg" "${APPLE_DIR}/img4.jpg"
sudo ln -s "${MY_DIR}/img5.jpg" "${APPLE_DIR}/img5.jpg"
sudo ln -s "${MY_DIR}/img6.jpg" "${APPLE_DIR}/img6.jpg"
sudo ln -s "${MY_DIR}/img7.jpg" "${APPLE_DIR}/img7.jpg"
sudo ln -s "${MY_DIR}/img8.jpg" "${APPLE_DIR}/img8.jpg"
sudo ln -s "${MY_DIR}/img10.jpg" "${APPLE_DIR}/img10.jpg"
sudo ln -s "${MY_DIR}/img11.jpg" "${APPLE_DIR}/img11.jpg"
sudo ln -s "${MY_DIR}/img12.jpg" "${APPLE_DIR}/img12.jpg"
sudo ln -s "${MY_DIR}/img100.jpg" "${APPLE_DIR}/img100.jpg"
sudo ln -s "${MY_DIR}/img101.png" "${APPLE_DIR}/img101.png"
sudo ln -s "${MY_DIR}/img102.jpg" "${APPLE_DIR}/img102.jpg"
sudo ln -s "${MY_DIR}/img103.png" "${APPLE_DIR}/img103.png"
sudo ln -s "${MY_DIR}/img104.jpg" "${APPLE_DIR}/img104.jpg"
sudo ln -s "${MY_DIR}/img105.jpg" "${APPLE_DIR}/img105.jpg"
sudo ln -s "${MY_DIR}/Wallpaper_Pirelli_FINAL.jpg" "${APPLE_DIR}/Wallpaper_Pirelli_FINAL.jpg"
sudo ln -s "${MY_DIR}/Win Brown 1920x1200.jpg" "${APPLE_DIR}/Win Brown 1920x1200.jpg"
sudo ln -s "${MY_DIR}/Win Chrome 1920x1200.jpg" "${APPLE_DIR}/Win Chrome 1920x1200.jpg"
sudo ln -s "${MY_DIR}/Win Green 1920x1200.jpg" "${APPLE_DIR}/Win Green 1920x1200.jpg"
sudo ln -s "${MY_DIR}/Win LtBlue 1920x1200.jpg" "${APPLE_DIR}/Win LtBlue 1920x1200.jpg"
sudo ln -s "${MY_DIR}/Win Orange 1920x1200.jpg" "${APPLE_DIR}/Win Orange 1920x1200.jpg"
sudo ln -s "${MY_DIR}/Win Pink 1920x1200.jpg" "${APPLE_DIR}/Win Pink 1920x1200.jpg"
sudo ln -s "${MY_DIR}/Win Purple 1920x1200.jpg" "${APPLE_DIR}/Win Purple 1920x1200.jpg"
sudo ln -s "${MY_DIR}/Win Red 1920x1200.jpg" "${APPLE_DIR}/Win Red 1920x1200.jpg"
sudo ln -s "${MY_DIR}/Win Yellow 1920x1200.jpg" "${APPLE_DIR}/Win Yellow 1920x1200.jpg"
sudo ln -s "${MY_DIR}/Win Blue 1920x1200.jpg" "${APPLE_DIR}/Win Blue 1920x1200.jpg"

echo "Done linking my Windows 8 desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}."
exit 0

#!/usr/bin/env bash

# @(#)Link-WindowsXP-Desktops.sh	0.1.0	09/04/2015
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
#       Link-WindowsXP-Desktops.sh

APPLE_DIR="/Library/Desktop Pictures"
MY_DIR="${HOME}/Pictures/My Desktops/Windows-XP"

echo "Begin linking my Windows XP desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}..."

sudo ln -s "${MY_DIR}/Ascent-1920x1200.jpg" "${APPLE_DIR}/Ascent-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Autumn-1920x1200.jpg" "${APPLE_DIR}/Autumn-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Azul-1920x1200.jpg" "${APPLE_DIR}/Azul-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Bliss-1920x1200.jpg" "${APPLE_DIR}/Bliss-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Blue-Hills-1920x1200.jpg" "${APPLE_DIR}/Blue-Hills-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Crystal-1920x1200.jpg" "${APPLE_DIR}/Crystal-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Follow-1920x1200.jpg" "${APPLE_DIR}/Follow-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Friend-1920x1200.jpg" "${APPLE_DIR}/Friend-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Home-1920x1200.jpg" "${APPLE_DIR}/Home-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Moon-Flower-1920x1200.jpg" "${APPLE_DIR}/Moon-Flower-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Peace-1920x1200.jpg" "${APPLE_DIR}/Peace-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Power-1920x1200.jpg" "${APPLE_DIR}/Power-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Purple-Flower-1920x1200.jpg" "${APPLE_DIR}/Purple-Flower-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Radiance-1920x1200.jpg" "${APPLE_DIR}/Radiance-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Red-Moon-Desert-1920x1200.jpg" "${APPLE_DIR}/Red-Moon-Desert-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Ripple-1920x1200.jpg" "${APPLE_DIR}/Ripple-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Stonehenge-1920x1200.jpg" "${APPLE_DIR}/Stonehenge-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Sunset-1920x1200.jpg" "${APPLE_DIR}/Sunset-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Tulips-1920x1200.jpg" "${APPLE_DIR}/Tulips-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Vortec-Space-1920x1200.jpg" "${APPLE_DIR}/Vortec-Space-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Water-Lilies-1920x1200.jpg" "${APPLE_DIR}/Water-Lilies-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Wind-1920x1200.jpg" "${APPLE_DIR}/Wind-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Winter-1920x1200.jpg" "${APPLE_DIR}/Winter-1920x1200.jpg"

sudo ln -s "${MY_DIR}/Chrysanthemum-1920x1200.jpg" "${APPLE_DIR}/Chrysanthemum-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Desert-1920x1200.jpg" "${APPLE_DIR}/Desert-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Hydrangeas-1920x1200.jpg" "${APPLE_DIR}/Hydrangeas-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Jellyfish-1920x1200.jpg" "${APPLE_DIR}/Jellyfish-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Koala-1920x1200.jpg" "${APPLE_DIR}/Koala-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Lighthouse-1920x1200.jpg" "${APPLE_DIR}/Lighthouse-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Penguins-1920x1200.jpg" "${APPLE_DIR}/Penguins-1920x1200.jpg"
sudo ln -s "${MY_DIR}/Tulips2-1920x1200.jpg" "${APPLE_DIR}/Tulips2-1920x1200.jpg"

echo "Done linking my Windows XP desktop images in ${MY_DIR} to the Apple set in ${APPLE_DIR}."
exit 0

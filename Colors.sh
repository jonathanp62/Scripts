#!/usr/bin/env bash

# @(#)Colors.sh	0.1.1	08/26/2015
# @(#)Colors.sh	0.1.0	07/09/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2015-09-01 11:07:38 -0400 (Tue, 01 Sep 2015) $
# @revision     $LastChangedRevision: 2987 $

# Usage:
#       Colors.sh

COLORS_FILE=${HOME}/Config/Colors.cfg

echo "INFO: Using colors file ${COLORS_FILE}..."

source ${COLORS_FILE} 2> /dev/null

if [ "$?" -ne 0 ]
then
	echo "ERROR: Unable to source colors file ${COLORS_FILE}."
	exit 1
fi

echo -e "${color_black}INFO: Some text displayed in black.${color_off}"
echo -e "${color_brown}INFO: Some text displayed in brown.${color_off}"
echo -e "${color_blue}INFO: Some text displayed in blue.${color_off}"
echo -e "${color_blue_light}INFO: Some text displayed in light blue.${color_off}"
echo -e "${color_cyan}INFO: Some text displayed in cyan.${color_off}"
echo -e "${color_cyan_light}INFO: Some text displayed in light cyan.${color_off}"
echo -e "${color_gray_dark}INFO: Some text displayed in dark gray.${color_off}"
echo -e "${color_gray_light}INFO: Some text displayed in light gray.${color_off}"
echo -e "${color_green}INFO: Some text displayed in green.${color_off}"
echo -e "${color_green_light}INFO: Some text displayed in light green.${color_off}"
echo -e "${color_orange}INFO: Some text displayed in orange.${color_off}"
echo -e "${color_purple}INFO: Some text displayed in purple.${color_off}"
echo -e "${color_purple_light}INFO: Some text displayed in light purple.${color_off}"
echo -e "${color_red}INFO: Some text displayed in red.${color_off}"
echo -e "${color_red_light}INFO: Some text displayed in light red.${color_off}"
echo -e "${color_white}INFO: Some text displayed in white.${color_off}"
echo -e "${color_yellow}INFO: Some text displayed in yellow.${color_off}"

echo "INFO: Back to the default color."

exit 0

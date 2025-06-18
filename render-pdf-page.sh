#!/usr/bin/env bash

# @(#)render-pdf-age.sh	0.1.0	03/29/2021
#
# Copyright (c) Penguin Random House, LLC
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate: 2020-11-05 09:29:13 -0500 (Thu, 05 Nov 2020) $
# @revision     $LastChangedRevision: 13143 $
#
# Usage:
#       render-pdf-page.sh pdf-page full-size lower-left dpi quality

if [ "$#" -ne 5 ]
then
        echo "Usage: $0 pdf-page full-size lower-left dpi quality"
        exit 1
fi

PDF_PAGE=${1}
FULL_SIZE=${2}
LOWER_LEFT=${3}
DPI=${4}
QUALITY=${5}

echo "INFO: PDF_PAGE  : ${PDF_PAGE}"
echo "INFO: FULL_SIZE : ${FULL_SIZE}"
echo "INFO: LOWER_LEFT: ${LOWER_LEFT}"
echo "INFO: DPI       : ${DPI}"
echo "INFO: QUALITY   : ${QUALITY}"

# Render the full size image

date
echo "INFO: convert -density ${DPI} ${PDF_PAGE} -quality ${QUALITY} ${FULL_SIZE}"

convert -density ${DPI} ${PDF_PAGE} -quality ${QUALITY} ${FULL_SIZE}

if [ "$?" -ne 0 ]
then
	echo "ERROR: Failed to render ${FULL_SIZE} from ${PDF_PAGE}."
	exit 1
else
	echo "INFO: PDF page ${PDF_PAGE} rendered successfully to ${FULL_SIZE}."
fi
date

# Get the height and width of the full size rendering

echo "INFO: identify -quiet -format W%wWH%hH ${FULL_SIZE}"

WH=$(identify -quiet -format W%wWH%hH ${FULL_SIZE})

if [ "$?" -ne 0 ]
then
	echo "ERROR: Failed to obtain the width and heigth from ${FULL_SIZE}."
	exit 1
else
	echo "INFO: Width and height of ${FULL_SIZE} identified: ${WH}"
fi
date

HREGEX=".*([H][[:digit:]]*[H]$)"
WREGEX="(^[W][[:digit:]]*[W]).*"

if [[ "${WH}" =~ ${WREGEX} ]]
then
	WIDTH=${BASH_REMATCH[1]}
else
	echo "ERROR: Width not matched"
fi

if [[ "${WH}" =~ ${HREGEX} ]]
then
	HEIGHT=${BASH_REMATCH[1]}
else
	echo "ERROR: Height not matched"
fi

if [ -z $WIDTH ]
then
	echo "ERROR: No width found in ${WH}."
	exit 1
fi

if [ -z $HEIGHT ]
then
	echo "ERROR: No height found in ${WH}."
	exit 1
fi

WIDTH=${WIDTH:1:${#WIDTH}-2}
HEIGHT=${HEIGHT:1:${#HEIGHT}-2}

echo "INFO: Width : ${WIDTH}"
echo "INFO: Height: ${HEIGHT}"

# Compute the height and width of a quadrant of the full size rendering

HALF_WIDTH=$((WIDTH / 2))
HALF_HEIGHT=$((HEIGHT / 2))

echo "INFO: Half width : ${HALF_WIDTH}"
echo "INFO: Half height: ${HALF_HEIGHT}"

# Render the lower left quadrant of the full size rendering

date
echo "INFO: convert ${FULL_SIZE} -crop ${HALF_WIDTH}x${HALF_HEIGHT}+0+${HALF_HEIGHT} ${LOWER_LEFT}"

convert ${FULL_SIZE} -crop ${HALF_WIDTH}x${HALF_HEIGHT}+0+${HALF_HEIGHT} ${LOWER_LEFT}

if [ "$?" -ne 0 ]
then
        echo "ERROR: Failed to render ${LOWER_LEFT} from ${FULL_SIZE}."
        exit 1
else
        echo "INFO: Lower left quadrant ${LOWER_LEFT} rendered successfully from ${FULL_SIZE}."
fi
date

exit 0

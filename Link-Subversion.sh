#!/usr/bin/env bash

# @(#)Link-Subversion.sh      0.1.0   07/30/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.0
# @updated      $LastChangedDate$
# @revision     $LastChangedRevision$
#
# Usage:
#       Link-Subversion.sh
#
# Create symbolic links in /usr/bin avoids having to run xcrun

SOURCE_DIR="/Applications/Xcode.app/Contents/Developer/usr/bin"
TARGET_DIR="/usr/bin"

echo "INFO: Linking Subversion command line utilities to the path..."

sudo ln -s "$SOURCE_DIR/svn" "$TARGET_DIR/svn"
sudo ln -s "$SOURCE_DIR/svnadmin" "$TARGET_DIR/svnadmin"
sudo ln -s "$SOURCE_DIR/svndumpfilter" "$TARGET_DIR/svndumpfilter"
sudo ln -s "$SOURCE_DIR/svnlook" "$TARGET_DIR/svnlook"
sudo ln -s "$SOURCE_DIR/svnserve" "$TARGET_DIR/svnserve"
sudo ln -s "$SOURCE_DIR/svnsync" "$TARGET_DIR/svnsync"
sudo ln -s "$SOURCE_DIR/svnversion" "$TARGET_DIR/svnversion"

echo "Done linking."
exit 0

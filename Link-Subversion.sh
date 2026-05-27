#!/usr/bin/env bash

# @(#)Link-Subversion.sh      0.1.0   07/30/2014
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

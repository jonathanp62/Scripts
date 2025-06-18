#!/usr/bin/env perl -w

# @(#)time.perl	0.1.0   09/03/2015
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

# Usage:
#       time.pl

use strict;
use warnings;

my $home = $ENV{'HOME'};
my $days = 185;
my $time = time;
my $expiration = $time - (60 * 60 * 24 * $days);

print "The current epoch value is $time.\n";
print "The expiration epoch value is $expiration or $days days ago.\n";

my $filename = "$home/Temp/ffmpeg-doc.txt";
my $mtime = (stat $filename)[9];

print "The current epoch value of $filename is $mtime.\n";

if ($mtime < $expiration) {
	print ("$filename is expired.\n");
}
else {
	print ("$filename is not expired.\n");
}

exit(0);

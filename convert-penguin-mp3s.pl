#!/usr/bin/env perl -w

# @(#)convert-penguin-mp3s.pl   0.1.1   07/15/2014
# @(#)convert-penguin-mp3s.pl   0.1.0   06/25/2014
#
# Copyright (c) Random House, Inc.
# 400 Hahn Road
# Westminster, MD 21157 U.S.A.
# All Rights Reserved.
#
# @author       Jonathan Parker
# @since        0.1.0
# @version      0.1.1
# @updated      $LastChangedDate: 2014-07-15 10:46:57 -0400 (Tue, 15 Jul 2014) $
# @revision     $LastChangedRevision: 1462 $

# Usage:
#       convert-penguin-mp3s.pl <MP3-DIR> <WAV-DIR>

use strict;
use warnings;

die "Usage: $0 <MP3-DIR> <WAV-DIR>\n" if @ARGV < 2;

my $home = $ENV{'HOME'};
my $mp3_to_wav = "$home/Scripts/mp3-to-wav.sh";
my ($mp3_base, $wav_base) = @ARGV;

print ("INFO: Will convert MP3 files in $mp3_base to WAV files in $wav_base.\n");

opendir(DIRMP3, $mp3_base) or die("ERROR: Cannot open $mp3_base.\n");

while (my $isbn = readdir(DIRMP3)) {
	if ($isbn !~ /^\./) {
		my $isbn_dir = "$mp3_base/$isbn";

		print ("INFO: Processing ISBN direcotry $isbn_dir...\n");
		mkdir "$wav_base/$isbn" or die("ERROR: Cannot create WAV ISBN directory $wav_base/$isbn.\n");

		opendir(DIRISBN, $isbn_dir) or die("ERROR: Cannot open $isbn_dir.\n");

		while (my $file = readdir(DIRISBN)) {
			if ($file !~ /^\./) {
				print ("INFO: Processing file $file...\n");
				system("$mp3_to_wav", "$isbn_dir/$file", "$wav_base/$isbn");

				if ($? == -1) {
					print "ERROR: Failed to execute $mp3_to_wav: $!\n";
				}
				elsif ($? & 127) {
					printf "ERROR: $mp3_to_wav died with signal %d, %s coredump\n",
					($? & 127),  ($? & 128) ? 'with' : 'without';
				}
				else {
					printf "INFO: $mp3_to_wav exited with value %d.\n", $? >> 8;
				}
			}
		}

		closedir(DIRISBN);
	}
}

closedir(DIRMP3);

exit(0);

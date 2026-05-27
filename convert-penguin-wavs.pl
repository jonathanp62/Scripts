#!/usr/bin/env perl -w

# @(#)convert-penguin-wavs.pl   0.1.1   07/15/2014
# @(#)convert-penguin-wavs.pl   0.1.0   07/11/2014
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
# @version      0.1.1
# @updated      $LastChangedDate: 2014-07-15 10:46:57 -0400 (Tue, 15 Jul 2014) $
# @revision     $LastChangedRevision: 1462 $

# Usage:
#       convert-penguin-wavs.pl <WAV_DIR> <MP3-DIR>

use strict;
use warnings;

die "Usage: $0 <WAV-DIR> <MP3-DIR>\n" if @ARGV < 2;

my $home = $ENV{'HOME'};
my $wav_to_mp3 = "$home/Scripts/wav-to-mp3.sh";
my ($wav_base, $mp3_base) = @ARGV;

print ("INFO: Will convert WAV files in $wav_base to MP3 files in $mp3_base.\n");

opendir(DIRWAV, $wav_base) or die("ERROR: Cannot open $wav_base.\n");

while (my $isbn = readdir(DIRWAV)) {
	if ($isbn !~ /^\./) {
		my $isbn_dir = "$wav_base/$isbn";

		print ("INFO: Processing ISBN direcotry $isbn_dir...\n");
		mkdir "$mp3_base/$isbn" or die("ERROR: Cannot create MP3 ISBN directory $mp3_base/$isbn.\n");

		opendir(DIRISBN, $isbn_dir) or die("ERROR: Cannot open $isbn_dir.\n");

		while (my $file = readdir(DIRISBN)) {
			if ($file !~ /^\./) {
				print ("INFO: Processing file $file...\n");
				system("$wav_to_mp3", "$isbn_dir/$file", "$mp3_base/$isbn");

				if ($? == -1) {
					print "ERROR: Failed to execute $wav_to_mp3: $!\n";
				}
				elsif ($? & 127) {
					printf "ERROR: $wav_to_mp3 died with signal %d, %s coredump\n",
					($? & 127),  ($? & 128) ? 'with' : 'without';
				}
				else {
					printf "INFO: $wav_to_mp3 exited with value %d.\n", $? >> 8;
				}
			}
		}

		closedir(DIRISBN);
	}
}

closedir(DIRWAV);

exit(0);

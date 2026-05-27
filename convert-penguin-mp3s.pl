#!/usr/bin/env perl -w

# @(#)convert-penguin-mp3s.pl   0.1.1   07/15/2014
# @(#)convert-penguin-mp3s.pl   0.1.0   06/25/2014
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

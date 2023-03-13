#!/usr/bin/perl
# Counts how many spaces exist in a file.

use strict;
no warnings;

use feature("say");

use FileHandle;


die "Usage: perl $0 <File>" if scalar(@ARGV) < 1;

my $file = FileHandle->new($ARGV[0], 'r');
my $spaces = 0;

while ($_ = $file->getline()) {
	$spaces += ($_ =~ tr/ //);
}

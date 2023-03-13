#!/usr/bin/perl

# A tool equivalent to wc UNIX command.

use 5.32.0;

use strict;
no warnings;

use feature("say");

use FileHandle;

die("Usage: perl $0 <file_name>") if not $ARGV[0];
$! = undef;

my $file = FileHandle->new("$ARGV[0]", 'r') or die "Error while opening the file $ARGV[0]\n";
my $lines = $numbers = $spaces = $tabs = $chars = 0;

until ($file->eof()) {
	my $char = $file->getc();
	++$chars;

	given ($char) {
		when (/\n/) { ++$lines; continue }
		when (/\d/) { ++$numbers; continue }
		when ($char eq ' ') { ++$spaces; continue }
		when (/\t/) { ++$tabs; continue }
	}
}

$file->close();

say << "HERE";
The file $ARGV[0] contains:
$chars	chars
$spaces	spaces
$lines	lines
$numbers numbers
$tabs	tabs
HERE
exit;

#!/usr/bin/perl
# A tool that returns the content of the specied file without comments on '#' standard. 
# It's useful to read server configuration services, for example.

use strict;
no warnings;

# use 5.36.0;
use feature "say";

use FileHandle;


my $path = $ARGV[0];
my $conf_file = FileHandle->new($path, 'r');

fatal("Usage: perl $0 <File>") unless defined $path;
fatal("Error while opening the file $path. Does it exists?") unless defined $conf_file;

my $match = '#';

while ($_ = $conf_file->getline()) {
	if ($_ !~ /$match/) {
		say;
	}
}

sub fatal {
        my $msg = shift;
        say $msg;
        exit;
}

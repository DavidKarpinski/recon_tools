#!/usr/bin/perl
# Reads the IPs of a specified log file.

use strict;
no warnings;

use feature("say");

use FileHandle;


my $file = $ARGV[0];
fatal("Usage: perl $0 <log file>") unless defined $file;
my $log_file = FileHandle->new($file, 'r');
fatal("$!") unless defined $log_file;

say 'IPs that tried to connect to the server:';

while (<$log_file>) {
	if ($_ =~ '(\d{1,3}\.){3}\d{1,3}') {
		say $&;
	}
}

sub fatal {
        my $msg = shift;
        say $msg;
        exit;
}

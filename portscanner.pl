#!/usr/bin/env perl

use strict;
use warnings;
use IO::Socket;

my $host = shift;
my @ports = (21, 22, 23, 80, 443);

print "PORT\tSTATUS\n";

foreach my $port (@ports) {
	my $socket = IO::Socket::INET->new(
		PeerAddr => $host,
		PeerPort => $port,
		Proto => 'tcp',
		Timeout => 2,
	);
	if ($socket) {
		print "$port\topen\n";
	} else {
		print "$port\tclosed\n";
	}
}

#!/usr/bin/perl

use strict;
use warnings;
use feature("say");
use IO::Socket::INET;


our ($host, $port) = ($ARGV[0], $ARGV[1]);
die "Usage: perl $0 <host> <port>" unless defined $host and defined $port;

my $socket = IO::Socket::INET->new(
	PeerAddr => $host,
	PeerPort => $port,
	Proto => 'tcp',
) or die "Cannot connect to $host:$port: $!\n";


for (;;) {
	print "you> ";
	my $message = <STDIN>;
	say $socket "$message";

	my $response = <$socket>;
	say "$host> $response";
}

$socket->close();

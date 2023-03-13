#!/usr/bin/perl

use 5.32.0;
use IO::Socket::INET;

our $port = $ARGV[0];
die "Usage: $0 <port>" if not defined $port;

our $server = IO::Socket::INET->new(
	LocalPort 	=> $port,
	Type		=> SOCK_STREAM,
	Reuse		=> 1,
	Listen		=> 10
) or die "Cannot create socket: $!\n";

say "Listening for incoming connections at port $port";

for (;;) {
	my $client = $server->accept();
	chomp(my $message = <$client>);
	say $message;
	close $client;
}

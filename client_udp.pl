#!/usr/bin/perl

use strict;
use warnings;
use feature('say');

use IO::Socket::INET;

my $socket = IO::Socket::INET->new(
    Proto => 'udp'
) or die "Error while creating socket: $!\n";

my ($host, $port) = @ARGV;
die "Usage: $0 <host> <port>\n" unless defined $host and defined $port;

for (;;) {
    print 'you> ';
    chomp(my $message = <STDIN>);
    $socket->send($message, 0, $host . ':' . $port) or die "Error while sending: $!\n";

    my $buffer;
    $socket->recv($buffer, 1024) or die "Error while receiving: $!\n";
    say "$host> $buffer";
}

$socket->close();

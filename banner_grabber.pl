#!/usr/bin/env perl

use strict;
use warnings;
use IO::Socket::INET;

my ($ip, $port) = @ARGV;
die "Usage: $0 <ip> <port>\n" unless defined $ip and defined $port;

my $socket = IO::Socket::INET->new(
    PeerAddr => $ip,
    PeerPort => $port,
    Timeout => 5,
) or die "Can't connect to $ip:$port: $!";

say $socket->getline();
$socket->close();

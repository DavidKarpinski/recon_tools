#!/usr/bin/env perl

use strict;
use warnings;
use feature('say');

use IO::Socket::INET;


my $ip = shift @ARGV;
die "Usage: $0 <ip>" if not defined $ip;

my $port_range = '0-1024';
my $timeout = 5;

foreach my $port (split /,/, $port_range) {
  my $socket = IO::Socket::INET->new(
    PeerAddr => $ip,
    PeerPort => $port,
    Timeout => $timeout,
  );
  
  if ($socket) [
    say "$port\topen";
    close($socket);
  }
}

#!/usr/bin/env perl

use strict;
use warnings;
use Net::RawIP;

my $target = shift @ARGV;
die "Usage: $0 <target>" unless defined $target;

my $src_ip = join('.', map int(rand(256)), 1..4);
my $raw = Net::RawIP->new({
  ip => {
    saddr => $src_ip,
    daddr => $target,
  },
  tcp => {
    source => int(rand(65536)),
    dest => 80,
    syn => 1,
  },
});

my @open_ports;

for (my $port = 1; $port <= 1024; $port++) {
  $raw->{tcp}->{dest} = $port;
  $raw->send;

  my $response = $raw->recv(5); # wait up to 5 seconds for response
  if ($response && $response->{tcp}->{syn} && $response->{tcp}->{ack}) {
    push @open_ports, $port;
    say "Port $port is open";
  }
}

if (!@open_ports) {
  say 'No open ports found';
}

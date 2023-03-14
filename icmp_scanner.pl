#!/usr/bin/perl
# A simple ICMP Echo scanner, to discover active hosts in a network.

use strict;
use warnings;
use feature('say');

use Net::Ping;


my ($network, $start_ip, $end_ip) = @ARGV;
die "Usage: $0 <network> <start_ip> <end_ip>\n" unless defined $network and defined $start_ip and defined $end_ip;

my $ping = Net::Ping->new('icmp');

for (my $i = $start_ip; $i <= $end_ip; $i++) {
  my $host = "$network.$i";
  if ($ping->ping($host, 1)) {
    say "$host is alive!";
  }
}

$ping->close();

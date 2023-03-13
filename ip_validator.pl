#!/usr/bin/perl

use feature "say";

my $match = '(\d{1,3}\.){3}\d{1,3}';
my $ip = $ARGV[0];

if (not defined $ip) {
	say "Usage: perl $0 <IP>";
	exit;
}

if ($ip !~ $match) {
	say 'It is not a valid IP Address!';
} else {
	say << "HERE";
PING $ip ($ip) 56(84) bytes of data.
64 bytes from $ip: icmp_seq=1 ttl=64 time=0.037 ms

--- $ip ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.037/0.037/0.037/0.000 ms

HERE
}

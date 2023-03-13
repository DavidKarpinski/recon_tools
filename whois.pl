#!/usr/bin/perl

use feature('say');
use Net::Whois::Raw;

my $host = $ARGV[0];
die "Usage: $0 <host>\n" if not defined $host;
my $info = whois($host);
say $info;

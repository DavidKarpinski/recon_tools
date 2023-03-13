#!/usr/bin/env perl

use Net::Ping;

my $host = $ARGV[0];
die "Usage: $0 <host>\n" unless defined $host;

for my $i (1..254) {
        my $target = $host . $i;
        my $p = Net::Ping->new();
        if ($p->ping($target)) {
                print "$target is up!\n";
        }
        $p->close();
}

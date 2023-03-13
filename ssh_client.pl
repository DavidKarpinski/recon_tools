#!/usr/bin/env perl
# If you liked the Python SSH Client, it's here the Perl version.

use strict;
use Net::SSH::Perl;

our $host = $ARGV[0];
die "Usage: $0 <host>" unless defined $host;
print 'Username: ';
our $user = <STDIN>;
print 'Password: ';
our $passwd = <STDIN>;

our $ssh = Net::SSH::Perl->new($host);
$ssh->login($user, $passwd);

for (;;) {
	print "$host $_";
	chomp(my $cmd = <STDIN>);
	my ($stdout, $stderr) = $ssh->cmd($cmd);
	say $stdout;
	say $stderr if $stderr;
}

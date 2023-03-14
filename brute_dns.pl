#!/usr/bin/env perl
# Usage: perl ./brute_dns.pl <domain> <wordlist>
# Makes a brute-forcing of subdomains based in a wordlist and returns the respectives IP addresses.

use 5.32.0;
use Net::DNS;

my $resolver = Net::DNS::Resolver->new();
my ($target, $wordlist) = @ARGV;

die "Usage: $0 <domain> <wordlist>\n" 
unless defined $target and defined $wordlist;

open my $fh, '<', $wordlist or die "Couldn't open the file $wordlist: $!\n";
chomp(my @subdomains = <$fh>);
close $fh;

foreach (@subdomains) {
  my $sub_target = "$_.$target";
  my $query = $resolver->search($sub_target, 'A');
  if ($query) {
    foreach my $rr ($query->answer) {
      next unless $rr->type eq 'A';
      say $rr->address . "\t$sub_target";
    }
  }
}

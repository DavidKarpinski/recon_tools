#!/usr/bin/perl
# A precision DNS Enumeration tool.

use 5.12.0;
use LWP::UserAgent;
use JSON;

my $host = shift @ARGV or die "Usage: $0 <host>\n";
my $url = "https://crt.sh/?q=$host&output=json";
my $ua = LWP::UserAgent->new();
my $response = $ua->get($url);
my $json_data = decode_json($response->content);

foreach (@$json_data) {
    my $name_value = $_->{name_value};
    my $subdomain;

    if ($name_value =~ /^\*\.(.*)$/) {
        $subdomain = $1;
    } else {
        ($subdomain) = split(/\./, $name_value);
    }

    say $subdomain unless $subdomain eq '*';
}

use 5.32.0;
use LWP::UserAgent;

my $url = shift @ARGV;
die "Usage: $0 <url>\n" if not defined $url;
my $ua = LWP::UserAgent->new;
my $headers = HTTP::Headers->new;

$headers->header('Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8');
$headers->header('Accept-Language' => 'en-US,en;q=0.5');
$headers->header('Connection' => 'keep-alive');
$headers->header('User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0');


my $response = $ua->get($url, 'headers' => $headers);

if ($response->header('Server') =~ /mod_security/i) {
    say 'WAF detected: Apache mod_security';
} elsif ($response->header('Server') =~ /cloudfront/i) {
    print 'WAF detected: Amazon CloudFront';
} elsif ($response->header('Server') =~ /cloudflare/i || $response->header('CF-RAY')) {
    say 'WAF detected: Amazon Cloudflare';
}

if ($response->header('X-AspNet-Version') =~ /^[\d\.]+$/) {
    say 'IPS detected: Microsoft IIS';
}

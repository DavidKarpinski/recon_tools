use strict;
no warnings;

use feature "say";

use FileHandle;

use constant HTTPD => '/etc/kismet/kismet_httpd.conf';

my $match = "allow"; # my $match = '^/s+Default';
my $conf_file = FileHandle->new(HTTPD, 'r');
say uc('Error') if not defined $conf_file;

while ($_ = $conf_file->getline()) { # while (defined($_ = $conf_file->getline())) { ... }
	if (/$match/) { # if ($_ =~ $match) { ... }
		print;
	}
}

$conf_file->close();

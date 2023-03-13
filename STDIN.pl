#!/usr/bin/env perl
# Another WTF file;

use strict;
no warnings;

print "Hello, Neo!\nDo you wan't to exit the Matrix? (Y/n)";
$response = <>;
chomp $response;

if ($response eq "Y" || $response eq "y") {
	print "Follow the White Rabbit!\n";
} elsif ($response eq "N" || $response eq "n") {
	print "So, take the blue pill!\n";
} else {
	print "You don't know what you want!?\nMake up your mind!\n";
}

print "\n";

print "Enter the message: ";
my $message = readline(STDIN);
print "Neo: $message\n";

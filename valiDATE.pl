#!/usr/bin/perl

use strict;
no warnings;

use feature("say");

my $match = /^(?:(?:(?:31\/(?:0?[13578]|1[02]))|(?:(?:29|30)\/(?:0?[1-9]|1[0-2])))\/(?:[1-9]\d\d\d|\d{2}(?![\d]))|(?:29\/0?2\/(?:(?:(?:1[6-9]|[2-9]\d)(?:0[48]|[2468][048]|[13579][26]))|(?:(?:16|[2468][048]|[3579][26])00))))$/;
chomp(my $date = <>);

if ($date =~ $match) {
	say 'It\'s a Valid Date';
	exit
}

say 'Invalid Date format';

#!/usr/bin/perl
# WTF this file is here!!?

for (my $c = 0; $c <= 100; $c++) {
	my $f = (1.8 * $c) + 32;
	my $k = ($f + 459.67) * (5/9);
	printf "%03d ºC\t%03d K\t%06.2f ºF\n", $c, $k, $f;
}

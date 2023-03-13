#!/usr/bin/perl

use FileHandle;

$file = FileHandle->new("/etc/passwd", "r");
@lines = $file->getlines;
print @lines;

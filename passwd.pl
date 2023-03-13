#!/usr/bin/perl
# A post-exploitation tool to read the content of /etc/passwd file.

use FileHandle;

$file = FileHandle->new("/etc/passwd", "r");
@lines = $file->getlines;
print @lines;

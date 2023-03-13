open($file, "<", "/etc/passwd");
while(<$file>) { print; }

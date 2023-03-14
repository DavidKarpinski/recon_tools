#!/usr/bin/env python3

import sys

import dns.resolver


resolver = dns.resolver.Resolver()

try:
	(target, wordlist) = (sys.argv[1], sys.argv[2])
except:
	print(f'Usage: python3 {sys.argv[0]} <domain> <wordlist>')
	sys.exit(1)

try:
	with open(wordlist, 'r') as file:
		subdomains = file.read().splitlines()
except Exception as e:
	print(f'Error while opening the file: {e}')
	sys.exit(1)

for subdomain in subdomains:
	try:
		sub_target = f'{subdomain}.{target}'
		results = resolver.resolve(sub_target, 'A')
		for result in results:
			print(f'{result}\t{sub_target}')
	except:
		pass

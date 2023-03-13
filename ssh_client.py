#/usr/bin/env python3

# Just so nobody can say that there is no Python file here.

import paramiko


host = '127.0.0.1' # Change this
user = 'kali' # Change this
passwd = 'kali' # Change this

client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect(host, username=user, password=passwd)

while True:
    stdin, stdout, stderr = client.exec_command(input('ssh> '))
    for line in stdout.readlines():
        print(line.strip())
    errors = stderr.readlines()
    if errors:
        print(errors)

#!/usr/bin/env bash

USERNAME=martin
## Locates and dehashes the secrets stored in .secrets
PASSWD=kali

#`cat ~/.secrets/windows_new.txt | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 \
#-iter 100000 -salt -pass pass:PecPet@923#`

rdesktop 192.168.122.246 -u $USERNAME -p $PASSWD -g 2560x1440 -x 0x8

## Best way to make and store hashed passwords.
##https://www.linuxtechi.com/encrypted-password-bash-shell-script/

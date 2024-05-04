#!/bin/bash

# Get hostname
HOSTNAME=$(hostname)

# Run pacman command and save output to hostname-pkglist.txt
/usr/bin/pacman -Qqetn > /home/martin/.config/packages/${HOSTNAME}-pkglist.txt

# Run pacman command and save AUR packages to hostname-foreignpkglist.txt
/usr/bin/pacman -Qqem > /home/martin/.config/packages/${HOSTNAME}-foreignpkglist.txt

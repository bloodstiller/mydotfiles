#!/bin/bash

# Set base directory
BASE_DIR="/home/martin/.config/packages"

# Create base directory if it doesn't exist
mkdir -p ${BASE_DIR}

# Get hostname
HOSTNAME=$(hostname)

# Define file paths
PKG_LIST="${BASE_DIR}/${HOSTNAME}-pkglist.txt"
FOREIGN_PKG_LIST="${BASE_DIR}/${HOSTNAME}-foreignpkglist.txt"

# Run pacman command and save output to hostname-pkglist.txt
/usr/bin/pacman -Qqetn > "${PKG_LIST}"
if [ $? -eq 0 ]; then
    echo "Native packages list created successfully."
else
    echo "Failed to create native packages list."
    exit 1
fi

# Run pacman command and save AUR packages to hostname-foreignpkglist.txt
/usr/bin/pacman -Qqem > "${FOREIGN_PKG_LIST}"
if [ $? -eq 0 ]; then
    echo "Foreign packages list created successfully."
else
    echo "Failed to create foreign packages list."
    exit 1
fi

# Set permissions and ownership
chmod 644 "${PKG_LIST}" "${FOREIGN_PKG_LIST}"
chown martin:martin "${PKG_LIST}" "${FOREIGN_PKG_LIST}"

echo "Permissions and ownership have been set."

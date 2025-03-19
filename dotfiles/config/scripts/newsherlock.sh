#!/usr/bin/env sh
#
read -p "Enter sherlock value: " base_dir
# Define the base directory, default if not provided
#

# Create directories using a nested structure
mkdir -p "$base_dir"

# Check if the folder structure already exists before copying
if [ ! -d "$base_dir/Org" ]; then

    cp -r ~/.config/orgTemplates/SherlockTemplate/SherlockTemplate.org "$base_dir/$base_dir-sherlock.org"

    cd $base_dir
    ln -s ~/Dropbox/screenshots .
    mkdir -p files

else
    echo "Org files already exists, not copying over."
fi

# Confirmation message
echo "Folder structure, files, created in $base_dir."

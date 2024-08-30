#!/bin/bash

read -p "Enter boxname value: " base_dir
# Define the base directory, default if not provided
#

# Create directories using a nested structure
mkdir -p "$base_dir"

# Check if the folder structure already exists before copying
if [ ! -d "$base_dir/Org" ]; then
    cp -r ~/.config/orgTemplates/BoxTemplate.org "$base_dir/$base_dir-box.org"

else
    echo "Org files already exists, not copying over."
fi

# Confirmation message
echo "Folder structure, files, created in $base_dir."

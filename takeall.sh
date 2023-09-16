#!/bin/bash

# Get the current directory as the base directory
base_directory=$(pwd)

# Specify the output file where all domains will be stored
output_file="all_domains.txt"

# Initialize the output file (create or clear it)
> "$output_file"

# Loop through each folder in the base directory
for folder in "$base_directory"/*; do
    if [ -d "$folder" ]; then
        # Check if the folder contains a "finalDomains.txt" file
        if [ -f "$folder/finalDomains.txt" ]; then
            echo "Processing folder: $folder"
            
            # Append the domains from finalDomains.txt to the output file
            cat "$folder/finalDomains.txt" >> "$output_file"
        else
            echo "No 'finalDomains.txt' found in folder: $folder"
        fi
    fi
done

echo "All domains have been copied to $output_file"

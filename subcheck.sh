#!/bin/bash

# Define the directory where your folders are located
base_directory=$(pwd)

# Loop through each folder in the base directory
for folder in "$base_directory"/*; do
    if [ -d "$folder" ]; then
        # Check if the folder contains a "finalDomains.txt" file
        if [ -f "$folder/finalDomains.txt" ]; then
            echo "Running subzy for folder: $folder"
            
            # Change to the folder directory
            cd "$folder" || exit 1
            
            # Run subzy with finaldomains.txt as input
            subzy run --targets finalDomains.txt --verify_ssl --hide_fails >> "subzy_output.txt"
            
	    echo "catting the output"
	    
            cat "subzy_output.txt"
            
            # Move back to the base directory
            cd "$base_directory" || exit 1
        else
            echo "No 'finalDomains.txt' found in folder: $folder"
        fi
    fi
done

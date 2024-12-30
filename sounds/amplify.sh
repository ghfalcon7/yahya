#!/bin/bash

# Loop through all mp3 files in the current directory
for file in *.mp3; do
    # Skip if no mp3 files are found
    if [ ! -f "$file" ]; then
        echo "No mp3 files found in the current directory."
        exit 1
    fi

    # Temporary output file
    temp_file="temp_$file"

    echo "Processing $file..."
    # Apply ffmpeg command
    ffmpeg -i "$file" -filter:a "volume=4.0" "$temp_file"

    # Replace the original file with the processed one
    mv "$temp_file" "$file"

    echo "$file processed successfully."
done

echo "All files processed."

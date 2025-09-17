#!/usr/bin/env bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &>/dev/null; then
	notify-send -a "File Operation" "ffmpeg is not installed. Please install it to use this script."
	exit 1
fi

# Loop through all selected files
for file in "$@"; do
	# Get the directory and filename without extension
	dir=$(dirname "$file")
	filename=$(basename "$file")
	name="${filename%.*}"

	# Convert the file to MP3
	if ffmpeg -i "$file" "$dir/$name.mp3"; then
		notify-send -a "File Operation" "Conversion complete!"
	else
		notify-send -a "File Operation" "Failed to convert $file to MP3"
	fi
done

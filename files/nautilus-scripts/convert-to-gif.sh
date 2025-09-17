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

	# Create a color palette
	palette="$dir/$name-palette.png"
	ffmpeg -y -i "$file" -vf "fps=25,scale=800:-1:flags=lanczos,palettegen" "$palette"

	# Convert the video to GIF using the palette
	if ffmpeg -i "$file" -i "$palette" -filter_complex "fps=25,scale=800:-1:flags=lanczos[x];[x][1:v]paletteuse" "$dir/$name.gif"; then
		rm "$palette" # Clean up the palette file
		notify-send -a "File Operation" "Conversion complete!"
	else
		notify-send -a "File Operation" "Failed to convert $file to GIF"
	fi
done

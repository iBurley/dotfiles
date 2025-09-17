#!/usr/bin/env bash

# Check if LibreOffice is installed
if ! command -v libreoffice &>/dev/null; then
	notify-send -a "File Operation" "LibreOffice is not installed. Please install it to use this script."
	exit 1
fi

# Loop through all selected files
for file in "$@"; do
	# Get the directory and filename without extension
	dir=$(dirname "$file")
	filename=$(basename "$file")
	name="${filename%.*}"

	# Convert the file to PDF
	if libreoffice --headless --convert-to pdf "$file" --outdir "$dir"; then
		notify-send -a "File Operation" "Conversion complete!"
	else
		notify-send -a "File Operation" "Failed to convert $file to PDF"
	fi
done

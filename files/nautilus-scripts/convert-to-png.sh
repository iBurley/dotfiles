#!/usr/bin/env bash

# Check if ImageMagick is installed
if ! command -v convert &>/dev/null; then
  notify-send -a "File Operation" "ImageMagick is not installed. Please install it to use this script."
  exit 1
fi

# Loop through all selected files
for file in "$@"; do
  # Get the directory and filename without extension
  dir=$(dirname "$file")
  filename=$(basename "$file")
  name="${filename%.*}"

  # Convert the file to PNG
  if convert "$file" "$dir/$name.png"; then
    notify-send -a "File Operation" "Conversion complete!"
  else
    notify-send -a "File Operation" "Failed to convert $file to PNG"
  fi
done

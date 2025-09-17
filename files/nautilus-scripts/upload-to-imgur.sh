#!/usr/bin/env bash

# Source API key from .env
if [ -f "$HOME/.local/share/nautilus/scripts/.env" ]; then
	source "$HOME/.local/share/nautilus/scripts/.env"
else
	notify-send -a "File Operation" "No .env file found. Please create one with your API key."
	exit 1
fi

# Check if curl is installed
if ! command -v curl &>/dev/null; then
	notify-send -a "File Operation" "curl is not installed. Please install it to use this script."
	exit 1
fi

# Loop through all selected files
for file in "$@"; do
	# Upload the file to Imgur
	response=$(curl -s -H "Authorization: Client-ID $IMGUR_API_KEY" -F "image=@$file" https://api.imgur.com/3/image)

	# Extract the link from the response
	link=$(echo "$response" | grep -o '"link":"[^"]*' | cut -d'"' -f4)

	if [ -n "$link" ]; then
		notify-send -a "File Operation" "Upload complete!"
		xdg-open "$link"
	else
		notify-send -a "File Operation" "Failed to upload $file to Imgur"
	fi
done

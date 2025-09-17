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
	# Read file content
	file_content=$(cat "$file")

	# Upload file to Pastebin
	response=$(curl -X POST -s \
		-d "api_dev_key=$PASTEBIN_API_KEY" \
		-d "api_option=paste" \
		--data-urlencode "api_paste_code=$file_content" \
		-d "api_paste_name=$(basename "$file")" \
		-d "api_paste_format=bash" \
		https://pastebin.com/api/api_post.php)

	# Check if upload was successful
	if [[ $response == http* ]]; then
		# Get the raw link
		raw_link="${response/pastebin.com/pastebin.com\/raw}"
		notify-send -a "File Operation" "Upload complete!"
		xdg-open "$raw_link"
	else
		notify-send -a "File Operation" "Failed to upload $file to Pastebin: $response"
	fi
done

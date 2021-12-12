#!/usr/bin/env bash

auth_key=$TIXTE_AUTH_KEY # dont share with anyone ofcourse
domain=$TIXTE_DOMAIN

api_url="https://api.tixte.com/v1/upload?random=true"

temp_file="/tmp/screenshot.png"

# Run flameshot --help for options
flameshot gui -r > $temp_file

# For some reason flameshot always seems to exit with 0 even when aborting the process
# so we had to find a way around that.
if [[ $(file --mime-type -b $temp_file) != "image/png" ]]; then
	rm $temp_file
  notify-send "Screenshot aborted" -a "Flameshot" && exit 1
fi

response=$(curl \
    --header "Authorization: $auth_key" \
    --header "domain: $domain" \
    -F file="@$temp_file" \
    "$api_url")

image_url=$(echo "$response" | jq -r '.data.url')

echo -n "$image_url" | xclip -sel c
notify-send "Image URL copied to clipboard" "$image_url" -a "Flameshot" -i $temp_file
rm $temp_file

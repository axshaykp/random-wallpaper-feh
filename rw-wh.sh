#!/bin/bash

file=$(curl -s "https://wallhaven.cc/random" \
	| sed 's.<a class="preview".\nwalllink.g' \
	| grep walllink \
	| awk -F '"' '{ print $2 }' \
	| awk -F '/' '{ print $5 }' \
	| shuf -n 1)
link=$(curl -s "https://wallhaven.cc/w/${file}" \
	-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101 Firefox/95.0' \
	| sed 's.<img id="wallpaper".\nwalllinks.g' \
	| grep walllinks \
	| awk -F '"' '{ print $2 }')
name=$(echo ${link} | awk -F '/' '{ print $6 }')
wget -q "${link}"
feh --bg-fill ${name}

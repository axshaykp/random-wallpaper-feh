num=$(shuf -i 1-10 -n 1)
file=$(curl -s "https://wallpapercave.com/latest-uploads/${num}" \
-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101 Firefox/95.0' \
	| sed 's.<img src=.\nwallimg.g' \
	| grep wallimg \
	| awk -F '"' '{ print $2 }' \
	| grep uwpr \
	| shuf -n 1 \
	| awk -F 'uwp' '{ print "uwp-" $3 }')
wget -q -O ${file} "https://wallpapercave.com/download/${file}"
feh --bg-fill ${file}

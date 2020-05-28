#!/bin/bash
input="/opt/eznas/TOCP.txt"
NASPath=$(cat /opt/eznas/mountrute.txt)
ObjectivePath=$(cat /opt/eznas/localroute.txt)
mkdir -p $ObjectivePath

while IFS= read -r line
do
	echo "$line"
		file="$NASPath/$line"
	if [[ -f $file ]]; then
		cp "$file" "$ObjectivePath"
	fi
	if [[ -d $file ]]; then
		cp -r "$file" "$ObjectivePath"
	fi
done < "$input"


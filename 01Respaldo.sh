#!/bin/bash
KeyPath="/root/Desktop/NAS/.iamhere"
Paths="/root/Desktop/prueba2"
NASPath="/root/Desktop/NAS"
ObjectivePath="/root/Desktop"
mkdir -p $ObjectivePath
if test -f $KeyPath; then
	echo "$FILE existeeee"   
input="/root/Desktop/GitDo.txt"
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
    else 
    echo "No existe"
fi


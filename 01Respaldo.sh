#!/bin/bash
input=( $( cat "/root/Desktop/GitDo.txt" ) )
KeyPath="/root/Desktop/NAS/.iamhere"
Paths="/root/Desktop/prueba2"
NASPath="/root/Desktop/NAS"
ObjectivePath="/root/Desktop"
mkdir -p $ObjectivePath
if test -f $KeyPath; then
	echo "$FILE existeeee"   
	for (( i = 0; i < ${#input[@]}; i++ ))
	do
		if [[ ${input[i]} != " " ]]; then 
			echo "''" ${input[i]} "''"
			  file="$NASPath/${input[i]}"
			if [[ -f $file ]]; then
				cp "$file" "$ObjectivePath"
			fi
			if [[ -d $file ]]; then
				cp -r "$file" "$ObjectivePath"
			fi
		fi

	done 
    else 
    echo "No existe"
fi


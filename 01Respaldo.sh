#!/bin/bash
input=( $( cat "/opt/eznas/TOCP.txt" ) )
NASPath=$(cat /opt/eznas/mountrute.txt)
ObjectivePath=$(cat /opt/eznas/localroute.txt)
mkdir -p $ObjectivePath

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
    


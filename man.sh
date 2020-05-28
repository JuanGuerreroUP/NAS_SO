#!/bin/bash

path="./eznas.1" 
pathMan="/usr/share/man/man1/" 

if test -f $path; then
echo existe eznas
fi

if test -f $path; then
echo existe man1
fi

cp $path $pathMan
gzip "$pathMan/eznas.1"

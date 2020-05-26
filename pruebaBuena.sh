#!/bin/bash

veldisk() { 
   pathNAS="$1"
   pathLocal="$2"
   size=$3
   blocks=$4
   if test -f "$pathNAS"; then 
     echo "Bajando"
     dd if="$pathNAS" of=/tmp/test.img bs=$size count=$blocks conv=fdatasync > resultado ; rm /tmp/test.img
     echo "Subiendo"
     dd if="$pathLocal" of=/tmp/test.img bs=$size count=$blocks conv=fdatasync > resultado ; rm /tmp/test.img
   fi
}

#$1--> path de NAS
#$2--> path Local
#$3--> tamaño de copiado
#$4--> número de bloques

veldisk "$1" "$2" "$3" "$4"

wait
echo "Proceso terminado"



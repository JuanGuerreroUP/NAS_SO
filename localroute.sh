#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
    echo "Necesitas ser root ejecutar este comando"
    exit 1
fi
if [[ $# -ne 1 ]]; then
    read -p "Ingresa la ruta de tu carpeta de copias locales: " -e copias
    else
    copias=$1
fi
copias+="/localnas"
mkdir -p $copias

echo $copias > /opt/eznas/localroute.txt

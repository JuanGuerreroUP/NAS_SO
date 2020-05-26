#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
    echo "Necesitas ser root ejecutar este comando"
    exit 1
fi

echo -e "Ingresa la ruta de tu carpeta de copias locales: "
read copias
copias+="/eznas"
mkdir -p $copias

echo $copias > /opt/eznas/localroute.txt

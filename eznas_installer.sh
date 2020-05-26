#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
    echo "Necesitas ser root para instalar eznas"
    exit 1
fi

apt-get install cifs-utils

mkdir -p /opt/eznas

#git clone
#copiar a rutas apropiadas


echo "-----------------------------------------------"
#ejecutar setup
/opt/eznas/setup.sh




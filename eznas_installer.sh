#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
    echo "Necesitas ser root para instalar eznas"
    exit 1
fi

apt-get install cifs-utils

mkdir -p /opt/eznas
mkdir -p /tmp/eznas
git clone https://github.com/JuanGuerreroUP/NAS_SO.git /tmp/eznas

cp /tmp/eznas/*.sh /opt/eznas/
chmod +x /opt/eznas/*.sh
cp /tmp/eznas/eznas.sh /bin/eznas.sh
chmod +x /bin/eznas.sh


echo "-----------------------------------------------"
#ejecutar setup
/opt/eznas/setup.sh




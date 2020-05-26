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
cp /tmp/eznas/eznas /bin/eznas
chmod +x /bin/eznas
> /opt/eznas/TOCP.txt
chmod -R a+rw /opt/eznas/TOCP.txt

cp /tmp/eznas/man/eznas /usr/local/man/man1/

echo "-----------------------------------------------"
#ejecutar setup
/opt/eznas/setup.sh


rm -r /tmp/eznas



exit 0


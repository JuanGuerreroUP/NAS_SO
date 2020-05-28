#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
    echo "Necesitas ser root para desinstalar eznas"
    exit 1
fi
echo -e "Seguro que deseas desinstalar eznas? [s/n]:"
read sure
if [[ $sure == s* ]]; then
    cp "$(dirname $0)/eznas_uninstaller.sh" /tmp/eznas_uninstaller.sh
    bash /tmp/eznas_uninstaller.sh &
else
    exit 1
fi
exit 0
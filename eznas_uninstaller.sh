#!/bin/bash
echo "$(dirname $0)/"

lineaMount=$(cat /etc/fstab | grep -n 'eznas-mount' | sed -n 1p | cut -f1 -d:)
if [[ ! -z $lineaMount ]]; then
    sed -i "$(($lineaMount))s/.*/ /g" /etc/fstab
    sed -i "$(($lineaMount+1))s/.*/ /g" /etc/fstab
fi


rm /bin/eznas
rm -r /opt/eznas
rm /usr/share/man/man1/eznas.1.gz
exit 0


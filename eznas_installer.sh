#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
    echo "Necesitas ser root para instalar eznas"
    exit 1
fi

apt-get install cifs-utils


echo "-----------------------------------------------"
error=1
until [[ $error -eq 0 ]]; do
    echo -e "Ingresa la dirección IP del servidor: "
    read server

    echo -e "Ingresa el nombre de la carpeta compartida: "
    read share

    echo -e "Ingresa el punto de montaje del servidor: "
    read mount
    mount+="/eznas"
    mkdir -p $mount

    echo -e "Ingresa el usuario de la carpeta compartida: "
    read usershare

    echo -e "Ingresa la contraseña de ${usershare}@${server}: "
    read contrashare

    mount -t cifs -o username=$usershare,password=$contrashare,rw,file_mode=0777,dir_mode=0777 //$server/$share $mount
    error=$?

    if [[ $error -ne 0 ]]; then
        echo "Error ($error). No se pudo montar directorio, revisa tu entrada o tu conexión con el servidor. Desea omitir este paso [s/n]?"
        read des
        if [[ $des == s* ]]; then
            break
        fi
    fi
done
echo -e "username=$usershare\npassword=$contrashare" > /etc/.eznascredentials

lineaMount=$(cat /etc/fstab | grep -n 'eznas-mount' | sed -n 1p | cut -f1 -d:)
stringMount="//$server/$share $mount cifs credentials=/etc/.eznascredentials,rw,file_mode=0777,dir_mode=0777 0 0"
if [[ -z $lineaMount ]]; then
    echo -e "\n#eznas-mount (do not modify)\n$stringMount\n" | tee -a /etc/fstab 
else
     sed -i "$(($lineaMount+1))s~.*~$stringMount~g" /etc/fstab
fi

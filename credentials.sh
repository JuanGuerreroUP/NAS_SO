#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
    echo "Necesitas ser root para ejecutar este comando"
    exit 1
fi

if [[ $# -ne 2 ]]; then
     echo -e "Ingresa el usuario de la carpeta compartida: "
    read usershare

    echo -e "Ingresa la contraseña de ${usershare}: "
    read contrashare
    else
    usershare=$1
    contrashare=$2
fi
echo -e "username=$usershare\npassword=$contrashare" > /etc/.eznascredentials
chmod 700 /etc/.eznascredentials
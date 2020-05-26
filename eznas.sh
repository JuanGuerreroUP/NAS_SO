#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "comando incorrecto, pruebe usar eznas -h para ver las opciones disponibles"
    exit 1
fi
case $1 in
    '-s')
        /opt/eznas/setup.sh
    ;;
    '-p')
        /opt/eznas/credentials.sh
    ;;
    '-l')
        /opt/eznas/localroute.sh
    ;;
    '-c')
        /opt/eznas/01Respaldo.sh
    ;;
    '-b')
        /opt/eznas/pruebaBuena.sh
    ;;
    '-h')
        echo "Opción no disponible"
    ;;
    *)
        echo "comando incorrecto, pruebe usar eznas -h para ver las opciones disponibles"
        exit 1
    ;;
esac
exit $?
#!/bin/bash

clear
if (( EUID != 0 ))
then
  echo "Només pot ser executat com a usuari root"
  exit 1
fi

echo -n "Diga'm el nom de l'arxiu de '/etc/default:' "
read etcdefault

cd /etc/default

if [[ -e $etcdefault ]]
then
    cp $etcdefault /media/$etcdefault.$(date +"%Y%m%d%H%M")
    exit 0
else 
    echo "ERROR: El fitxer demanat no existeix"
    exit 1
fi

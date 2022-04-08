#!/bin/bash

if [ $EUID != 0 ]
then
        echo "Només pot ser executat com a usuari root"
        exit 1
fi
while [ true ]
do
clear
echo
echo -n "Escriu el nom de l'usuari que vol cambiar la password: "
read nom
echo -n "Escriu el nou password per al usuari: "
read password
echo "$nom:$password" | chpasswd
echo
echo "Contrasenya canviada"
echo
echo ""
        echo "Vols continuar?: (s/n)"
        read yn
        case $yn in
                y)      clear
                        ;;
                n)      exit 2
                        ;;
                *)      echo "Selecciona s o n"
                        ;;
        esac
done

exit 1

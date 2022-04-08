#!/bin/bash
clear
	if [ $EUID != 0 ]
	then
	echo "Només pot ser executat com a usuari root"
	exit 1
	else
	wget http://www.collados.org/asix2/m06/uf2/alumnes.ods
	if (( $? != 0 ))
		then
			echo "Error, no s'ha pogut descarregar!"
			exit 2
		else
			libreoffice --headless --convert-to csv alumnes.ods
		if (( $? != 0 ))
			then
				echo "No s'ha pogut convertir!"
				exit 3
			else
				rm alumnes.ods
				cat alumnes.csv | cut -d "," -f 2 > alumnes2.csv
				rm alumnes.csv
				mv alumnes2.csv alumnes.csv
			while read nom
				do
					PASSWORD=$(echo $RANDOM$(date +%N%s) | md5sum | cut -c 2-11)
					echo "Nom:$nom , Contrasenya:$PASSWORD" >> contrasenyes_alumnes.txt
					echo "------------------------------------------------------------------------------------" >> contrasenyes_alumnes.txt
			done < alumnes.csv
			if (( $? != 0 ))
				then
					echo "ERROR inesperat, tancant programa amb codi 4"
					exit 4
				else
				exit 0
				fi
			fi
		fi
	fi

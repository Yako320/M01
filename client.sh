#!/bin/bash

PORT="2022"

echo "Cliente de Dragón Magia Abuelita Miedo 2022"

echo "1. ENVÍO DE CABECERA"

echo "DMAM2022" | nc localhost $PORT

DATA=`nc -l $PORT`

echo "3. COMPROBACION DE CABECERA"

if [ "$DATA" != "OK_HEADER" ]
then
	echo "ERROR 1: La Cabecera Se Envió Incorrectamente"
	exit 1
fi

echo "4. ENVIO NOMBRE DE ARCHIVO"

echo "FILE_NAME dragon.txt" | nc localhost $PORT

nc -l $PORT

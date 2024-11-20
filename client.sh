#!/bin/bash

if [ "$1" == "" ]
then
	echo "Debes indicar la direccion del servidor."
	echo "Ejemplo:"
	echo -e "\t$0 127.0.0.1"
	exit 1
fi

IP_SERVER=$1

IP_CLIENT=`ip a | grep "score global" | xargs | cut -d " " -f 2 | cut -d "/" -f 1`
PORT="2022"

echo "Cliente de Dragón Magia Abuelita Miedo 2022"

echo "1. ENVÍO DE CABECERA"

echo "Enviando Cabecera"
echo "DMAM2022 $IP_CLIENT" | nc $IP_SERVER $PORT

DATA=`nc -l $PORT`

echo "3. COMPROBACION DE CABECERA"

if [ "$DATA" != "OK_HEADER" ]
then
	echo "ERROR 1: La Cabecera Se Envió Incorrectamente"
	exit 1
fi
echo "Cabecera Correcta"

echo "4. ENVIO NOMBRE DE ARCHIVO"

echo "Enviando nombre de archivo..."
FILE_NAME="dragon.txt"

echo "FILE_NAME $FILE_NAME" | nc $IP_SERVER $PORT

DATA=`nc -l $PORT`

echo "7. COMPROBACION DE PREFIJO"
if [ "$DATA" != "OK_FILENAME" ]
then
	echo "ERROR 2: El Prefijo Se Envio Incorrectamente"
	exit 2
fi

echo "Prefijo Correcto"

echo "8. ENVIO DEL CONTENIDO"
echo "Enviando Contenido..."
cat /home/enti/projects/M01/client/dragon.txt | nc $IP_SERVER $PORT
echo "Contenido Enviado"

DATA=`nc -l $PORT`

echo "11. RECIBIR OK_DATA"

echo "12. ENVIO MD5 DATOS"

echo "15. FIN"

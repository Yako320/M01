#!/bin/bash

PORT="2022"

echo "Cliente de Dragón Magia Abuelita Miedo 2022"

echo "1. ENVÍO DE CABECERA"

echo "Enviando Cabecera"
echo "DMAM2022" | nc localhost $PORT

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

echo "FILE_NAME $FILE_NAME" | nc localhost $PORT

DATA=`nc -l $PORT`

echo "7. COMPROBACION DE PREFIJO"
if [ "$DATA" != "OK_FILENAME" ]
then
	echo "ERROR 2: El Prefijo Se Envio Incorrectamente"
	exit 2
fi

echo "Prefijo Correcto"

echo "8. ENVIO DEL CONTENIDO"
cat /home/enti/projects/M01/client/dragon.txt | nc localhost $PORT

DATA=`nc -l $PORT`

echo "11. RECIBIR OK_DATA"

echo "12. ENVIO MD5 DATOS"

echo "15. FIN"

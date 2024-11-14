#!/bin/bash

PORT="2022"

echo "Servidor de Dragón Magia Abuelita Miedo 2022"

echo "0. ESCUCHAMOS"

DATA=`nc -l $PORT`

if [ "$DATA" != "DMAM2022" ]
then
	echo "ERROR 1: Cabecera Incorrecta"
	echo "KO_HEADER" | nc localhost 2022
	exit 1
fi

echo "2. CHECK OK - Enviando OK_HEADER"
echo "OK_HEADER" | nc localhost 2022

echo "5. CHECK FILENAME"
FILENAME=`nc -l $PORT`

PREFIJO=`echo "$FILENAME" | cut -d' ' -f1`

if [ "$PREFIJO" != "FILE_NAME" ]
then
 	echo "ERROR 1: Prefijo Incorrecto"
 	echo "KO_FILENAME" | nc localhost 2022
 	exit 1
fi

echo "6. CHECK OK - Enviando OK_FILENAME"
echo "Enviando OK_FILENAME..."
echo "OK_FILENAME" | nc localhost 2022

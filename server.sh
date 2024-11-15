#!/bin/bash

PORT="2022"

echo "Servidor de Dragón Magia Abuelita Miedo 2022"

echo "0. ESCUCHAMOS"

DATA=`nc -l $PORT`

echo "Comprobando Cabecera..."
if [ "$DATA" != "DMAM2022" ]
then
	echo "ERROR 1: Cabecera Incorrecta"
	echo "KO_HEADER" | nc localhost 2022
	exit 1
fi
echo "Cabecera Correcta"

echo "2. CHECK OK"

echo "Enviando Confirmacion"
echo "OK_HEADER" | nc localhost 2022

echo "5. CHECK FILENAME"

echo "Comprobando Prefijo..."
DATA=`nc -l $PORT`

PREFIX=`echo "$DATA" | cut -d ' ' -f1`

if [ "$PREFIX" != "FILE_NAME" ]
then
 	echo "ERROR 2: Prefijo Incorrecto"
 	echo "KO_FILENAME" | nc localhost $PORT
 	exit 2
fi
echo "Prefijo Correcto"

echo "6. CHECK OK"
echo "Enviando OK_FILENAME..."
echo "OK_FILENAME" | nc localhost $PORT

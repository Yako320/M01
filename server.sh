#!/bin/bash

PORT="2022"

echo "Servidor de Dragón Magia Abuelita Miedo 2022"

echo "0. ESCUCHAMOS"

DATA=`nc -l $PORT`
HEADER=`echo "$DATA" | cut -d " " -f 1`
IP=`echo "$DATA" | cut -d " " -f 2`

echo "Comprobando Cabecera..."
if [ "$HEADER" != "DMAM2022" ]
then
	echo "ERROR 1: Cabecera Incorrecta"
	echo "KO_HEADER" | nc $IP $PORT
	exit 1
fi
echo "Cabecera Correcta"

echo "La IP del cliente es: $IP"

echo "2. CHECK OK"

echo "Enviando Confirmacion"
echo "OK_HEADER" | nc $IP $PORT

echo "5. CHECK FILENAME"

echo "Comprobando Prefijo..."

PREFIX=`nc -l $IP $PORT | cut -d ' ' -f 1`

if [ "$PREFIX" != "FILE_NAME" ]
then
 	echo "ERROR 2: Prefijo Incorrecto"
 	echo "KO_FILENAME" | nc $IP $PORT
 	exit 2
fi
echo "Prefijo Correcto"

echo "6. CHECK OK"
echo "Enviando OK_FILENAME..."
echo "OK_FILENAME" | nc $IP $PORT

DATA=`nc -l $PORT`

echo "9. RECIBO Y ALMACENAMIENTO DE DATOS"
echo "Recibiendo Datos..."
echo "$DATA" > ./server/$NOMBRE

echo "10. CHECK DATA"

echo "13. RECIBO MD5"

echo "14. CHECK MD5"

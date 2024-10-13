#!/bin/sh
clear
lineas=$(wc -l < /etc/profile)
echo "El numero de lineas del archivo /etc/profile es:, ${lineas}"
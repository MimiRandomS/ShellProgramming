#!/bin/sh

grep -i "failure" /var/log/authlog | cut -d: -f 1,2,3
total=$(grep -i "failure" /var/log/authlog | wc -l)
echo "Numero de intentos fallidos: $total"

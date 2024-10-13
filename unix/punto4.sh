#!/bin/sh
clear

output_file="punto4.txt"
awk -F: '{print $1 ": " $5}' /etc/passwd > "$output_file"
echo "Los nombres de los usuarios y sus descripciones se han guardado en $output_file."
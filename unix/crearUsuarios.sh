#!/bin/sh
clear

user_name="User0"
user_description="Description for User"
count=1

while [ $count -le 5 ]; do
    user="${user_name}${count}"
    desc="${user_description}${count}"
    echo "Creando usuario: ${user}"
    useradd -c "$desc" -m "$user"
    count=$((count + 1))
done

echo "Todos los usuarios han sido creados."

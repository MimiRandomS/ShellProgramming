#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <name> <path>"
    exit 1
fi

name=$1
directory=$2

if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    exit 1
fi

path="$directory/$name"

if [ ! -e "$path" ]; then
    echo "'$name' does not exist in the directory '$directory'."
    exit 1
fi

if [ -f "$path" ]; then
    echo "'$name' is a file in the directory '$directory'."
elif [ -d "$path" ]; then
    echo "'$name' is a subdirectory in the directory '$directory'."
else
    echo "'$name' is something else (not a regular file or directory) in the directory '$directory'."
fi
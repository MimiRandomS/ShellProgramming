#!/bin/sh

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <path> <permissions>"
  echo "Example: $0 /etc/ -rw-r--r--"
  exit 1
fi

directory=$1
permissions=$2

if [ ! -d "$directory" ]; then
  echo "Error: Directory '$directory' does not exist."
  exit 1
fi

count_matching_files=$(ls -l "$directory" | awk -v perm="$permissions" '$1 == perm {print $0}' | wc -l)

total_files=$(ls -l "$directory" | grep -v '^d' | wc -l)

echo "Total number of files in '$directory': $total_files"
echo "Number of files with permissions '$permissions': $count_matching_files"

if [ "$count_matching_files" -eq 0 ]; then
  echo "No files with the specified permissions were found."
else
  read -p "Do you want to list the files with permissions '$permissions'? (y/n): " choice

  if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    echo "Listing files in '$directory' with permissions '$permissions':"
    ls -l "$directory" | awk -v perm="$permissions" '$1 == perm {print $0}' | more
  else
    echo "No files listed."
  fi
fi
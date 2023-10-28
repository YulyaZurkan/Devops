# Написати скрипт, який аргументами приймає шлях та текст, але аргументи визначаються ключами (
#  -p path -s string ), а повертає всі файли, що містять даний текст в даній директорії.

#!/bin/bash

 
path=""
string=""

 
while getopts "p:s:" opt; do
  case $opt in
    p)
      path="$OPTARG"
      ;;
    s)
      string="$OPTARG"
      ;;
    \?)
      echo "Invalid flag: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ -z "$path" ]; then
    echo "Error: Please provide the target directory using the -p flag."
    exit 1
fi

if [ -z "$string" ]; then
    echo "Error: Please provide the text to search for using the -s flag."
    exit 1
fi


if [ -d "$path" ]; then
    result_files=$(find "$path" -maxdepth 1 -type f -exec grep -l "$string" {} \;)
    
    if [ -n "$result_files" ]; then
        dir_name=$(basename "$path")
        echo "In '$dir_name' directory there are files that include '$string':"
        echo "$result_files" | xargs -n 1 basename
    else
        echo "No files include '$text' were found in '$path'."
    fi
else
    echo "Error: The directory '$path' does not exist."
    exit 1
fi


# Написати скрипт, який аргументами приймає шлях та розширення, 
# а повертає кількість файлів з заданим розширенням у  даній директорії

#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Please provide exactly 2 arguments: 1 - target directort; 2 - extension."
    exit 1
fi

target_directory="$1"
target_extension="$2"

if [ -d "$target_directory" ]; then
    count=$(find "$target_directory" -maxdepth 1 -type f -name "*.$target_extension" | wc -l)
    echo "There are $count files with .$target_extension extension"
else
    echo "Error: The directory '$target_directory' does not exist."
    exit 1
fi


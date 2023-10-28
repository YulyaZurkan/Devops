# Написати скрипт, який аргументами приймає шлях та розширення файлів, 
# а повертає всі файли з таким розширенням в даній директорії
#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Please provide exactly 2 arguments: 1 - target directort; 2 - extension."
    exit 1
fi

target_directory="$1"
target_extension="$2"

if [ -d "$target_directory" ]; then
    find "$target_directory" -maxdepth 1 -type f -name "*.$target_extension" -exec basename {} \;
else
    echo "Error: The directory '$target_directory' does not exist."
    exit 1
fi


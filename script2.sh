# Написати скрипт, який аргументами приймає шлях та текст,
# а повертає всі файли, що містять даний текст в даній директорії
#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Please provide exactly 2 arguments: 1 - target directory; 2 - text to search."
    exit 1
fi

directory="$1"
text="$2"

if [ -d "$directory" ]; then
    result_files=$(find "$directory" -maxdepth 1 -type f -exec grep -l "$text" {} \;)
    
    if [ -n "$result_files" ]; then
        dir_name=$(basename "$directory")
        echo "In '$dir_name' directory there are files that include '$text':"
        echo "$result_files" | xargs -n 1 basename
    else
        echo "No files include '$text' were found in '$directory'."
    fi
else
    echo "Error: The directory '$directory' does not exist."
    exit 1
fi

#!/bin/bash

# Check if directory is provided as an argument
if [ $# -eq 0 ]; then
    echo "Please provide a directory as an argument."
    exit 1
fi

# Get the directory from the argument
directory="$1"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory '$directory' does not exist."
    echo "Please provide a valid directory name."
    exit 2
fi

# Create a file to save the contents of the directory
touch content

# Create the tree structure of the project (excluding .git folder)
echo " $directory tree structure (excluding .git folder):" > content
tree -I '.git' "$directory" >> content

# Find all files in the directory (excluding files starting with "." and .git folder) and store them in an array
readarray -t files < <(find "$directory" -type f -not -name ".*" -not -path "./.git/*")

# Loop through each file and copy content to the content file
for file in "${files[@]}"; do
   echo "" >> content
   file_name=$(basename "$file")
   echo "File name: $file_name" >> content
   cat "$file" >> content
   echo "" >> content
done

echo "Writing to file 'content' is done"

#!/bin/bash

# get the current directory
curr_dir=$(pwd)

#create a file "Dockerfile"
touch Dockerfile

# list of the most common dockerfile instruction 
instruction=(
    "FROM"
    "WORKDIR"
    "COPY"
    "RUN"
    "ENV variable=value"
    "EXPOSE "
    "CMD["",""]"
)

# Loop thorugh the list
echo "Creating a generic dockerfile"
for instruction in "${instruction[@]}"
do
    echo "$instruction" >> Dockerfile
done

echo "a generic Dockerfile is ready"


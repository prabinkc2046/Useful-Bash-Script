#!/bin/bash

# Check three arguements are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 audio_file_path video_file_path output_file_name"
    exit 1
fi

aud=$1
vid=$2
output=$3
workingDir="output"
# Check if the file exits or not
if [ ! -e "$aud" ]; then
   echo "$aud file does not exit."
   exit 2
fi

# Check if the file exits or not
if [ ! -e "$vid" ]; then
   echo "$vid file does not exit."
   exit 3
fi

mkdir "$workingDir"
cd  "$workingDir"

/usr/bin/ffmpeg -i "../$aud" -i "../$vid" -c:v copy -c:a aac -strict experimental "$output.mkv"

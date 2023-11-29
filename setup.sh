#!/bin/bash


# Requirements:
# Running as root
# Run on a newly installed Linux Operating System
# Ubunut operating system

#  Update and upgrade the linux  to the last patches
sudo apt update -y && sudo apt upgrade -y 

# Checks if the update and upgrade was successful
exit_code_for_update=$(echo $?)
if [[ "$exit_code_for_update" == "0" ]]; then
   echo ""
    echo "Update was successful"
else
    echo ""
    echo "Update didn't complete well. Exiting..."
    exit 1
fi


#!/bin/bash

# This script checks if Python 3 is installed and installs it if necessary.
# It then prompts the user to provide a directory name to set up a virtual environment.
# The script creates the specified directory, moves into it, and creates a virtual environment within it.
#
# This script is intended for Ubuntu.
#
# Usage:
#   source script_name.sh
#
# Note: Use the 'source' command (or '.') to run the script so that the virtual environment activation persists in the current shell.

# Check if Python 3 is installed or not
python_version=$(python3 --version)

if [[ "$python_version" == "Python 3"* ]]; then
    echo "Python 3 is already installed. Nothing to do."
else
    echo "Python 3 is not installed. Installing Python 3..."
    sudo apt update -y
    sudo apt install python3 -y
    echo "Python 3 installation is completed."
    python_version=$(python3 --version)
    echo "Python version is $python_version"
fi

# Ask the user for the directory to set up a virtual environment
echo "Enter the name of the directory you want to create a virtual environment"
read project_dir

# Create the user-provided directory in the current directory
current_dir=$(pwd)
mkdir -p "$current_dir/$project_dir"

# Move to the user-requested directory
cd "$project_dir"

# Create a virtual environment
echo "Enter the name of the virtual environment"
read virtual_env
echo "Creating a virtual environment '$virtual_env' within $project_dir"
python3 -m venv "$virtual_env"
source "$virtual_env/bin/activate"

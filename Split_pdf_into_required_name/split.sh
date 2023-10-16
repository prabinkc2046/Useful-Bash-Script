#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_pdf> <names_file>"
    exit 1
fi

source_pdf="$1"
names_file="$2"

# Check if pdftk is installed
if ! command -v pdftk &> /dev/null; then
    echo "Error: pdftk is not installed. Please install pdftk and try again."
    exit 1
fi

# Check if the source PDF file exists
if [ ! -f "$source_pdf" ]; then
    echo "Error: Source PDF file '$source_pdf' not found."
    exit 1
fi

# Check if the names file exists
if [ ! -f "$names_file" ]; then
    echo "Error: Names file '$names_file' not found."
    exit 1
fi

# Create output directory if it doesn't exist
output_dir="output_pdfs"
mkdir -p "$output_dir"

# Counter for page number
page_number=1

# Loop through each line in the names file
while IFS= read -r name; do
    # Skip empty lines
    if [ -z "$name" ]; then
        continue
    fi

    # Use pdftk to burst the specific page into individual PDF
    pdftk "$source_pdf" cat $page_number output "$output_dir/${name}.pdf"

    echo "Page $page_number of PDF has been split into '$output_dir/${name}.pdf'."
    
    # Increment the page number
    ((page_number++))
done < "$names_file"

#!/bin/bash

read -p "Enter first file: " file1
read -p "Enter second file: " file2

if cmp -s "$file1" "$file2"
then
    echo "Files are identical."
    rm "$file2"
    echo "$file2 deleted."
else
    echo "Files are different."
fi
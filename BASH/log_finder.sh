#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Error: Directory does not exist"
    exit 1
fi

echo "===== Log Finder Summary ====="
echo "Directory: $directory"
echo

log_files=$(find "$directory" -type f -name "*.log" -mtime -7)

count=$(echo "$log_files" | grep -c ".log")
total_lines=0

echo "Number of log files found: $count"
echo

echo "File-wise line count:"
echo "$log_files" | while read file
do
    if [ -n "$file" ]; then
        lines=$(wc -l < "$file")
        echo "$file : $lines lines"
    fi
done | sort

echo

for file in $log_files
do
    lines=$(wc -l < "$file")
    total_lines=$((total_lines + lines))
done

echo "Total lines across all files: $total_lines"
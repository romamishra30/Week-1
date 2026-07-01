#!/bin/bash

read -p "Enter number of terms: " n

a=0
b=1
count=1

while (( count <= n ))
do
    echo -n "$a "
    temp=$((a+b))
    a=$b
    b=$temp
    ((count++))
done

echo
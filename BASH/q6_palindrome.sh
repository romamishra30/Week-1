#!/bin/bash

read -p "Enter a number: " num

original=$num
reverse=0

while (( num > 0 ))
do
    digit=$((num % 10))
    reverse=$((reverse * 10 + digit))
    num=$((num / 10))
done

if (( original == reverse ))
then
    echo "$original is a palindrome"
else
    echo "$original is not a palindrome"
fi
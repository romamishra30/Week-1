#!/bin/bash

read -p "Enter a number: " num

if (( num <= 1 ))
then
    echo "$num is not prime"
    exit
fi

flag=1

for ((i=2; i<=num/2; i++))
do
    if (( num % i == 0 ))
    then
        flag=0
        break
    fi
done

if (( flag == 1 ))
then
    echo "$num is prime"
else
    echo "$num is not prime"
fi
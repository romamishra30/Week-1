#!/bin/bash

length=${1:-16}
count=${2:-1}

if (( length < 8 || length > 128 )); then
    echo "Error: Password length must be between 8 and 128"
    exit 1
fi

if (( count < 1 || count > 100 )); then
    echo "Error: Count must be between 1 and 100"
    exit 1
fi

chars='A-Za-z0-9!@#$%^&*()_-=+[]{};:,.<>?'

for ((i=1; i<=count; i++))
do
    password=$(tr -dc "$chars" < /dev/urandom | head -c "$length")
    echo "$password"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $password" >> passwords.log
done
#!/bin/bash
echo "Enter a number:"
read number
reverse=0
while [ $number -gt 0 ]; do
 digit=$((number % 10))
 reverse=$((reverse * 10 + digit))
 number=$((number / 10))
done
echo "Reverse of the input number is: $reverse"
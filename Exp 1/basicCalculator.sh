#!/bin/bash
echo "Welcome to the Basic Calculator!"
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2
echo "Select an operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read -p "Enter your choice (1/2/3/4): " choice
case $choice in
1)
result=$((num1 + num2))
operator="+"
;;
2)
result=$((num1 - num2))
operator="-"
;;
3)
result=$((num1 * num2))
operator="*"
;;
4)
result=$(awk "BEGIN {print $num1 / $num2}")
operator="/"
;;
*)
echo "Invalid choice"
exit 1
;;
esac
echo "Result: $num1 $operator $num2 = $result"
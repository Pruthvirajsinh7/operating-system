#!/bin/bash
read -p "Enter file name : " file
read -p "Enter lines to be printed : " a
exec < "$file"
count=0
total_lines=$(wc -l <"$file")
while read -r b;
do
if [ "$count" -ge $(($total_lines - $a)) ]
then
echo "$b"
fi
count=$(( $count + 1 ))
done



#!/bin/bash
read -p "Enter file name : " file
read -p "Enter lines to be printed : " a
exec < "$file"
count=0
while read -r b;
do
if [ "$count" -eq "$a" ]
then
break
fi
echo "$b"
count=$(( $count + 1 ))
done
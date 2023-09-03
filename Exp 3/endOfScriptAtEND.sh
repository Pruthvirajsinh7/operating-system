#!bin/bash
read -p "Enter file name:" file
touch file
line=0
while true;
do
read a
if [ "$a" = end ] || [ "$a" = END ];
then
break
fi
echo "$a" >> "$file"
line=$(($line+1))
done
echo "line are written"
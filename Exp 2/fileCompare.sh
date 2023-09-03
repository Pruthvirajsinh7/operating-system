#!/bin/bash
echo enter file1 and file2
read file1
read file2
if cmp $file1 $file2
then
echo " Files are same."
else
echo " Files are different."
fi
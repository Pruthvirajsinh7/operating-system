# This combinations of two 3 no 1 2 & 3
#!/bin/bash
for i in 1 2 3
do
for j in 1 2 3
do
for k in 1 2 3
do

# If dont repeat same number 
#if [ $i -ne $j ]&&[ $j -ne $k ]&&[ $k -ne $i ]
#then

echo "$i$j$k"
#fi
done
done
done
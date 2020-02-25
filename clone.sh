#!/bin/bash

#Script to clone out VM's in bulk

#WILL NEED TO MAKE CHANGES IF YOU WANT LINKED/FULL CLONE WHEN CLONING TEMPLATES

echo "Enter the ID of the VM you would like to clone."
read curid

echo "Enter the start number of the ID the range you want for the clones."
read startid

echo "Enter the end number of the ID range for the clones."
read endid

echo "Enter name you would like for VM's. (Will clone as <Name><VM-ID>)"
read name

echo "Enter name of the pool you would like to add VM to."
read pool

echo ""
echo $curid
echo $startid
echo $endid
echo $name
echo $pool
echo ""

#Used for end of range, because loops end one before
end=$((endid+1))

while [ $startid -lt $end ]
do
	qm clone $curid $startid --name $name$startid --pool $pool

	#Counter
	startid=$((startid+1))
done

echo "Cloning of box is done."

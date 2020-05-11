#!/bin/bash

# Script will accept directory name as an argument & will list all file names 
# along with their size whose file size will exceed 1000 Bytes.
# will also list down such files in descending order of their size

if [ $# -lt 1 ]
then
	echo "Insufficient arguments!"
	exit 1
fi

ls -lAS $1 | while read -r fname;
do

	fsize=$(echo $fname | cut -d ' ' -f5)
	if [[ $fsize -gt 1000 ]]
	then
		echo $fname
	fi
done



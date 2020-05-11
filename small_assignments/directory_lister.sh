#!/bin/bash

ls -lA './' | while read -r fileName;
do
	if [ -r "${fileName}" -a -w "$fileName" ] 
	then
		echo "$fileName has all  permissions"
	fi
done

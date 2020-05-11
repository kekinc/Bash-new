#!/bin/bash

# Directory lister script will list all the files in the directory which are
# having read, write & execute permissions.
# Author: Kekin Chheda



ls -lA './' | while read -r fileName;
do
	if [ -r "${fileName}" -a -w "${fileName}" -a -x "${fileName}"] 
	then
		echo "$fileName has all  permissions"
	fi
done

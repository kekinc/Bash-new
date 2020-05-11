#!/bin/bash
# File comparator program will take two arguments file1 & file 2 name

#Author: Kekin Chheda

if [ $# -lt 2 ]
then
	echo "Insufficient arguments."
	exit 1
else
	if cmp -s $1 $2;
	then 
		echo "Both file contents are same ${file2} will get deleted"
		rm -i $2
	else
		echo "Both files are different."
	fi
fi



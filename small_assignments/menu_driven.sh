#!/bin/bash

# Script is to give user Following options
# 1. Display contents of /etc/passwd
# 2. List users who have currently logged in.
# 3. Present working directory
# 4. Exit
# Author: Kekin Chheda

echo "Enter Appropriate option in order to perform following"
echo "1) Display contents of /etc/passwd"
echo "2) List users who have currently logged in"
echo "3) List content sof present working directory"
echo "4) Exit"
echo 
echo 
read -p "Enter your option: " option

case $option in 
	1)
		cat /etc/passwd
		;;
	2)
		w
		;;
	3)
	       ls -Al ./
	       ;;
       	4)
 		exit 0
		;;
	*)
		echo "Invalid option!"
		exit 1
		;;
esac




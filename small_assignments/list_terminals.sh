#!/bin/bash
#List terminals script will list all the terminals where current user is
#  loggedin

#Author: Kekin Chheda

echo "Currently Loggedin user: $LOGNAME"

w -h $LOGNAME | while read -r user
do 
	echo "User $LOGNAME is logged in to following terminals: "
	echo $user | cut -d ' ' -f1,2
done




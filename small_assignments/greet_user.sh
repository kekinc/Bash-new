#!/bin/bash

# Script file to Greet user with Good Morning/Good Afternoon/Good Evening or Good Night depending upon the
# time user logs in
# in order to execute this script moment user logs in you have to add it under directory /etc/profile.d
# OR you can add below code to Either to the file /etc/profile or to the /home/<username>/.bashrc

hourOfDay=$(date '+%H')

if [ $hourOfDay -ge 6 -a $hourOfDay -lt 12 ]
then
	echo "Good Morning ${USER}!"
elif [ $hourOfDay -ge 12 -a $hourOfDay -lt 16 ]
then 
	echo "Good Afternoon ${USER}!"
elif [ $hourOfDay -ge 16 -a $hourOfDay -lt 23 ]
then
	echo "Good Evening ${USER}!"
else
	echo "Good Night ${USER}!"
fi



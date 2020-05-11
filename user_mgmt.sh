#!/bin/bash

echo "###################################################################"
echo "########## Welcome to the User Management Application! ############"
echo "###################################################################"
echo
echo
echo "Add--> To add new user"
echo "Search--> To search user by user id"
echo "Change--> To Change the password"
echo "Delete--> To delete user"
echo "Display--> To display all user information"
echo
echo
read -p "Enter your choice: " ch

function addUser(){
	read -p "Enter user first name: " fname
	read -p "Enter user last name: " lname
	read -p "Enter user ID: " userID
	read -s -p "Enter password: " upasswd
	echo
	read -s -p "Confirm password: " cpasswd

	
	#check to see whether user already present or not
	if [ $(grep -iP "$userID" userInfo.txt | wc -l) -gt 0 ]
	then
		echo "User with ID ${userID} already exists."
		exit 1
	fi


	if [ $upasswd = $cpasswd ]
	then 
		touch userInfo.txt && chmod u+rw userInfo.txt
		ENCPASSWD=$(echo $upasswd|openssl enc -aes-256-cbc -a -salt -pass pass:DarkKnight)
		
		echo "$fname|$lname|$userID|$ENCPASSWD" >> userInfo.txt
		echo "User added successfully!"
	else
		echo "Password not matched!"
		exit 1
	fi
}

function searchUser(){
	searchResults=$(grep -i $1 userInfo.txt | cut -d \|  -f 1,2,3)
	echo $searchResults
}

function deleteUser(){
	if [ $(grep -iw $1 userInfo.txt | wc -l)  -gt 0 ]
	then
		#User found to be deleted
		sed "/[a-zA-Z]*|[a-zA-Z]*|$1/d" userInfo.txt > temp.txt
		cat temp.txt > userInfo.txt
		rm temp.txt
		if [ $2 != 'supressMsg' ]
		then
			echo "User with ID $1 is deleted successfully!"
		fi
	else
		echo "User with ID $1 doesn't exists."	
		exit 1
	fi
}

function encryptStr(){
	ENCSTR=$(echo $1|openssl enc -aes-256-cbc -a -salt -pass pass:DarkKnight)
	echo  $ENCSTR
}

function decryptStr(){
	DECSTR=$(echo $1|openssl enc -aes-256-cbc -a -d -salt -pass pass:DarkKnight)
	echo $DECSTR
}

function changePassword(){
	echo "ChangePassword is called $1 $2"

	#Search whether USERID is valid or not
	#$(searchUser $1)
}

case $ch in
	Add)
		#Add user
		addUser
		;;
	Search)
		#Search user by user id
		read -p "Enter user ID: " userID
		searchUser $userID
		;;
	Change)
		#Change user password
		read -p "Enter user ID: " uID
		read -s -p "Enter password: " upasswd
		echo
		read -s -p "Enter new password: " newPasswd
		echo 
		read -s -p "Confirm your new password: " cnfrmPasswd

		if [ $newPasswd != $cnfrmPasswd ] 
		then
			echo "Password matching failed!"
			exit 1
		fi
		#Checking whether user exists with uID or not
		if [ $(grep -Pi $uID userInfo.txt|wc -l) -gt 0  ]
		then
			oldEncPassWD=$(grep -Pi $uID userInfo.txt|cut -d '|' -f4)
			fname=$(grep -Pi $uID userInfo.txt|cut -d '|' -f1)
			lname=$(grep -Pi $uID userInfo.txt|cut -d '|' -f2)

			oldPassWD=$(decryptStr $oldEncPassWD)
			newEncPasswd=$(encryptStr $newPasswd)

			if [ $oldPassWD = $upasswd ]
			then
				#"You can change the password!!"
				#encPasswd=$(encryptStr $oldPassWD)
				#deleting the entry with old password
				deleteUser $uID 'supressMsg'
				#appending the entry with new  password
				echo "$fname|$lname|$uID|$newEncPasswd"
				echo "$fname|$lname|$uID|$newEncPasswd" >> userInfo.txt
				exit 0
			else
				echo "You are not authorised to change the password of $uID!"
				exit 1
			fi	
		else
			echo "User with ${uID} doesn't exists!"
			exit 1
		fi
		#changePassword $uID $upasswd
		;;
	Delete)
		#Delete user
		read -p "Enter userID which you want to delete: " userID
		deleteUser $userID
		exit 0
		;;
	Display)
		#To display all user information
		echo
		echo
		echo "---------- Users ----------------"
		cat userInfo.txt | cut -d \| -f 1,2,3
		echo "---------------------------------"
		;;
	*)
		echo "Invalid option!"
		;;
esac



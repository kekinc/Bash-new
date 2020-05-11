#!/bin/bash

echo "Current process ID is: $$"


function searchInventory(){

	#while [ IFS = read -r results ]
	#do
		#echo $results
	#done << grep -P -in $1 bookInventory.txt

	grep -Pin $1 'bookInventory.txt' | while read -r line;
	do
		echo $line
	done
}

function deleteRecord(){

	echo "RecordID: $1"
	read -p "Are you sure you want to delete this record (y/n)" ch

	if [ $ch = 'y' -o $ch = 'yes' ]
	then
		if [[ $(grep "^$1" bookInventory.txt) ]]
		then 
			sed "/^$1/d" bookInventory.txt > newInventory.txt
			rm bookInventory.txt
			mv newInventory.txt bookInventory.txt
			echo "Record with ID $1 is deleted successfully!"
		else
			echo "Record with $1 ID doesn't exists in inventory"
			exit 1
		fi	
	else
		exit 1
	fi
}	

function editRecord(){

	echo "Edit Record: "
}


echo
echo
echo "###########################################################################"
echo "             Welcome to the Book Management Software           "
echo "###########################################################################"

echo "   Where you can perform simple CRUD operations on inventory of books"
echo
echo "   Note: Press Key 1-For Add, 2-For Search, 3-For Update & 4-For Delete"
echo 
read -p "Please select option from above: " option

case $option in
	1) 
		echo "You can add information about the book in following format."
		echo "<BookName>|<CommaSeparatedListOfAuthors>|<Price>|<ISBN>|<Publication>|<Edition>|<#Copies>"
		read -p "Enter information about books: " bookInfo
		touch bookInventory.txt
		primaryKey=$(($RANDOM*$$))
		if [[ $parimaryKey -eq 0 ]]
		then
			primaryKey=$(($RANDOM*$$))
		fi
		echo "${primaryKey}|${bookInfo}" >> bookInventory.txt
		;;
	2)
		echo "You can lookup the book inventory by title or isbn"
		read -p "Enter your search query here: " query
		searchInventory $query
		#echo "Your query is: $query"
		#searchResults=$(grep -P -in "$query" bookInventory.txt) 
		#echo $searchResults
		;;
	4)
		read -p "Enter primary key of the record you want to delete: "	id
		deleteRecord $id
		;;

	3)
		read -p "Enter primary key to edit the record: " bookId
		newBookEntry=''
		echo  "======== Enter details you want to edit ======= "
		echo
		echo
		echo "Note: Blank values are accepted"
		read -p "Title: " bookTitle
		read -p "Author: " author
		read -p "#Copies: " copies
		read -p "Price: " price
		read -p "ISBN: " isbn
		read -p "Publication: " publication
		read -p "Edition: " edition
		
		#check whether primary key is valid or not

		bookEntry=$(grep -w "$bookId" bookInventory.txt)
		echo "Book Entry is: ${bookEntry}"
		
		echo "Author $author"
		
		if [ ! -z "$bookTitle" ]
		then
			echo
			
		fi
		;;	
		
	*)
		echo "Invalid option!"
		exit 1
		;;	
esac	





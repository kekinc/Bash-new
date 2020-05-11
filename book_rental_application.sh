#!/bin/bash
echo
echo 

echo "-------------------------->  Welcome to the ABC Book Company <----------------------------"

read -p "Please enter Name of the book issued: " bookName
read -p "Please enter date of the issue for the book (m/d/y): " dateOfIssue



sec1=$(date -d $dateOfIssue  '+%s')
sec2=$(date '+%s')

if [ $sec2 -lt $sec1 ]
then
	echo 'Please enter valid date of issue'
	exit 1
fi

secElapsed=$(($sec2 - $sec1))
daysElapsed=$(($secElapsed/(3600*24)))



#-----------------------------------------check to see if book is returned on or after 9PM.-------------------------------------------------------------------------------

if [ $(date  '+%H') -ge  '21' ]
then
	daysElapsed=$(($daysElapsed+1))
fi





rent=$(($daysElapsed*30))


#-----------------------------------------Calculating the discount based on return day--------------------------------------------
issueDay=$(date -d $dateOfIssue '+%A')

if [ $issueDay =  'Saturday' ]
then
	discountRate=0.3
elif [ $issueDay =  'Sunday' ]
then
	discountRate=0.5
else
	discountRate=0
fi

discountAmt=$(echo $rent*$discountRate | bc)
finalRent=$(echo $rent-$discountAmt |bc)

#-----------------------------------------Displaying final rent payable------------------------------------------------
echo 
echo 
echo "-------------------------Invoice-----------------------------------"

echo "| Book selected:    |    ${bookName}"
echo "| Date of issue:    |    $(date -d $dateOfIssue '+%A, %d %B %Y')"
echo "| Date of return:   |    $(date '+%A, %d %B %Y')"
echo "| Possession:       |    ${daysElapsed}"
echo "| Rent:             |    ${rent}"
echo "| Availed Discount: |    ${discountAmt}"
echo "| Final rent:       |    ${finalRent}"

echo "-------------------------------------------------------------------"
echo
echo
echo "Thank you!"


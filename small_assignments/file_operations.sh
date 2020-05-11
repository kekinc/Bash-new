#!/bin/bash


# file_operations.sh script file contains following different operations performed on the files & directory
#Author: Kekin Chheda

#Create 5 empty files file1,file2,file3,file4 & file5
touch file1 file2 file3 file4 file5


#create file data.txt & storing name, age, address, email, gender & contact in it.
#another alternative approach on bash will be cat > data.txt & enter following information
touch data.txt && echo "Name: Kekin Chheda" > data.txt && echo "Age: 30" >> data.txt && echo "Address: 3102, N Grandview Boulevard, Waukesha, Wisconsin" >> data.txt && echo "email:kekin.chheda@citiustech.com" >> data.txt && echo "Contact: 9167683083" >> data.txt && echo "Gender: Male" >> data.txt


#Displaying contents of data.txt on the screen 
cat data.txt


#Make copy of data.txt into another file called as data_backup.txt
cp  data.txt  data_backup.txt


#Create temp.txt file & write any 2 sentences in it
touch temp.txt && echo "This is temp file & it is awesome file." > temp.txt && echo "This second sentence & this is awesome sentence I've ever written" >> temp.txt


#Combine the content of data.txt & temp.txt into another file called as tempdata.txt
cat data.txt temp.txt > tempdata.txt


#Delete the file data.txt
rm data.txt


#create link file tempfilelnk.txt for temp.txt
ln -s /home/kekin/Desktop/Linux_Assignments/small_assignments/temp.txt   /home/kekin/Desktop/Linux_Assignments/small_assignments/tempfilelnk.txt

#Change permissions of the file data_backup.txt to 666
chmod 665 data_backup.txt
#another alternative approach
chmod u=rw,g=rw,o=rw data_backup.txt

#OR
chmod a=rw data_backup.txt

#Renaming the file data_backup.txt to data.txt
mv data_backup.txt data.txt

#Create directory called mydir in current directory
mkdir ./mydir

#Move the files data.txt & tempdata.txt in mydir
mv data.txt ./mydir/data.txt && mv tempdata.txt ./mydir/tempdata.txt

#create another directory newdir under mydir
mkdir  ./mydir/newdir

#copy the contents of mydir to newdir
mv ./mydir/data.txt  ./mydir/newdir/data.txt  && mv  ./mydir/tempdata.txt  ./mydir/newdir/tempdata.txt

#delete mydir & newdir in one shot.
rm -rf ./mydir

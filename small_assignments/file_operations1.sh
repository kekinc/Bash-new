#!/bin/bash

# file_operations1.sh contains following different operations perfomed related to file & users

# Author: Kekin Chheda


# Below command will create different users within myGrp.
# below users will be needed in order to play around with chmod 

# myGrp is a group that will get read & execute permissions for /opt/data.txt
# Alex, Peter, Harry & Bob are part of myGrp
#addgroup myGrp
#adduser Alex --group myGrp && adduser Peter --group myGrp && adduser Harry --group myGrp && adduser Bob --group myGrp

#adduser Tom

# Create file data.txt under /opt
#touch /opt/data.txt

#chown Alex:myGrp /opt/data.txt


# Create file called as notes.txt & giving full permissions
touch notes.txt && chmod 777 notes.txt


# create file test with rw-rwx--- permissions
touch test && chmod 670 test


#create file myfile with permissions r--r--r-- permissions
touch myfile && chmod 444 myfile

# create file myfile under home & create hardlink for it
touch /home/myfile && ln  /home/myfile  /home/myfilelnk


#create shortcut of myfile under /var

ln -s /home/myfile  /var/myfilelnk

rm /home/myfile && cd /var #check broken symlink myfilelnk

#adduser Sachin && su Sachin
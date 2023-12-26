#!/bin/bash
#Date: 2023-12-26
#Author: Sachin Gupta

echo "#######Welcome to new user creation in Linux system############"
echo 
echo "Please enter user name: "
read username

grep -q $username /etc/passwd
if [ $? -eq 0 ]
then
	echo " This user name has already been taken. Please choose some other user name."
	exit 0
fi

echo "Please prvide user description"
read user_des

echo "Do you want to choose user id(Y/N)?"
read choice

if [ $choice = 'Y' ] || [ $choice = 'y' ]
then 
	echo "Please enter user id"
	read uid
	grep -q $uid /etc/passwd
	if  [ $? -eq 0 ]
	then 
		echo "this user id has already been taken"
		exit 0
	fi
	useradd -u $uid -c "$user_des" $username
else
	useradd -c "$user_des" $username
fi


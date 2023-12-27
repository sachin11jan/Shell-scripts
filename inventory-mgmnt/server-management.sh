#!/bin/bash
#Date: 2023-12-31

echo Welcome to sever management tool
echo
echo Please choose either of options
echo a = To add a server in server list
echo b = To delete a server from server list
echo e = exit
echo 
read choice

while [ $choice != e ] 
do
case $choice in
	a) ~/scripts/inventory-mgmnt/add-record.sh ;;
	b) ~/scripts/inventory-mgmnt/del-record.sh ;;
	e) exit 0 ;;
	*) echo Incorrect selection.Please select one of the given option
esac

read choice
done


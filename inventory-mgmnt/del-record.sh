#!/bin/bash
#Description: this script will  server delete record in server list file
#Date: 2023-12-31

echo "Please enter server host name to delete its record from server list"
read host

host_count=`awk '{print $1}' ~/scripts/inventory-mgmnt/server.list|grep -wc $host`
if [ "$host_count" != 0 ]
then
	gawk -i inplace -v var=$host '$1 != var { print $0 }' server.list	
	echo Server $host has deleted successfully
else
	echo Entered host name not found
fi

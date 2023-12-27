#!/bin/bash
#Description: this script will add a server record in server list file
#Date: 2023-12-31

echo "Please enter host name"
read host

host_count=`awk '{print $1}' ~/scripts/inventory-mgmnt/server.list|grep -wc $host`
if [ "$host_count" != 0 ]
then
	echo host is already present
	exit 0;
fi

echo "Please enter serve ip address"
read IP

IP_count=`awk '{print $2}' ~/scripts/inventory-mgmnt/server.list|grep -wc $IP`
if [ "$IP_count" != 0 ]
then
        echo IP is already present
        exit 0;
fi

echo "Please enter serve description"
read Description

echo $host $IP \"$Description\" >>server.list
echo
echo Server $host has successfully added

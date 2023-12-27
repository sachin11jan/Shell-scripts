#!/bin/bash
i=`ps -e|grep -c $1`
if [ $i -gt 0 ]
then
	ps -eaf|grep $1|grep -v grep|awk '{print $2}'|xargs -I {} kill -9 {} &> /dev/null
	if [ $? -eq 0 ]
	then
		echo "all process killed"
	else
		echo "process failed to kill"
	fi
else
	echo "$1 wan't running" 
fi

	

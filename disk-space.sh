#!/bin/bash

df -H|egrep -v "Filesystem|devtmpfs|tmpfs|containers"|awk '{print $1,$5}'|while read op
do
	fs_name=`echo $op|awk '{print $1}'`
	space_per=`echo $op|awk '{print $2}'`
	space_filled=`echo $space_per|cut -d"%" -f1`
	if [ $((space_filled)) -gt 20 ]
	then 
		echo $fs_name filesyatem space has filled to $space_per over threshold 
	fi
done


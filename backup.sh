#!/bin/bash
#Created on : 2023-12-21
#Author : Sachin

cd /tmp
tar -cvf backup-$(date +%Y%m%d%H%M%S).tar --absolute-names ~/scripts/ &> /dev/null

gzip /tmp/backup-$(date +%Y%m%d%H%M%S).tar &> /dev/null

find backup-*.tar.gz -mtime -1 -type f -print &> /dev/null 
if [ $? -eq 0 ]
then 
	echo /etc Backup has created
	echo transfering the archive to backup server
	#scp backup-*.tar.gz user@BACK-UP-SERVER-IP:/backup/file/
	/rm  backup-*.tar.gz
else
	echo Backup failed
fi

cd ~/scripts


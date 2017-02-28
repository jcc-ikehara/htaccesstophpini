#!/bin/sh

for db in `mysqlshow |grep _|cut -d\  -f 2`;do
	user=`echo $db|cut -d_ -f1`
	echo -n "$user,$db,"
	find /home/${user}/public_html -type f -print0|xargs -0 grep -l $db
done

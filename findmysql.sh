#!/bin/sh

TMPFILE="/tmp/mysql4tempfile.txt"
rm -f $TMPFILE
for db in `mysqlshow |grep _|cut -d\  -f 2`;do
        user=`echo $db|cut -d_ -f1`
        find /home/${user}/public_html -type f -print0|xargs -0 grep -Ho $db | uniq >> $TMPFILE
done

for l in `cat $TMPFILE`;do
        f=`echo $l|cut -d: -f1`
        db=`echo $l|cut -d: -f2`
        echo "db=$db, file is $f"
done

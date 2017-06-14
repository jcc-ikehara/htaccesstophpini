#!/bin/sh

# ファイル抽出
# TMPFILE書式 i
# delimiter :
# fullpath:db_name
TMPFILE="/tmp/mysql4tempfile.txt"
TMPDIR="/tmp/jccmysql4tmpdir"

# initialize
rm -rf $TMPDIR
rm -f $TMPFILE
mkdir $TMPDIR

# find
for db in `mysqlshow |grep _|cut -d\  -f 2`;do
        user=`echo $db|cut -d_ -f1`
        find /home/${user} -type f \( -name \*\.php -o -name \*\.html -o -name \*\.cgi -o \*\.pl -o \*\.ini -o -name \*\.htm \) -print0|xargs -0 grep -oH $db|uniq >>$TMPDIR/$db
done

cat $TMPDIR/* > $TMPFILE

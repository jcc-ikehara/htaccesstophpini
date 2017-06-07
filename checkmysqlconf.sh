#!/bin/sh
# function
genpass() {
        len=12
	[ $# -eq 1 ] && [ $1 -gt 1 ] && len=$1
        cat /dev/urandom|tr -dc 'a-zA-Z0-9'|fold -w $len|head -n 1
}

TMPDIR="/tmp/jccmysql4tmpdir"
MYSQL4="mysql4.joes-cloud.com"
IPADDR=`grep IPADDR /etc/sysconfig/network-scripts/ifcfg-eth0 | awk -F= '{print $2}'| sed -e 's/"//g' -e "s/'//g"`
DBCOMMAND="$TMPDIR/dbcommand"
NEWDBDATA="$TMPDIR/configfilelist"
rm -f $DBCOMMAND $NEWDBDATA

# 加工

for db in `/bin/ls $TMPDIR`;do
		pass=`genpass 12`
        	user=`echo $db|cut -d_ -f1`
		newdb="${user}_`genpass 5`"
		echo "echo \"create database $newdb;\"|mysql" >> $DBCOMMAND
		echo "echo \"GRANT ALL ON $newdb.* TO $newdb@\'$IPADDR\' IDENTIFIED  BY \'$pass\';\"|mysql" >> $DBCOMMAND
	for l in `cat $TMPDIR/$db`;do
        	fp=`echo $l|cut -d: -f1`
	        fn=`basename $fp`
		echo "$fp:$newdb:$pass" >> $NEWDBDATA
			if [ $fn = "wp-config.php" ]; then
				sed -e "s/define.*DB_NAME.*/define \( 'DB_NAME', '$newdb' \)/" -e "s/define.*DB_USER.*/define \( 'DB_USER', '$newdb' \)/" -e "s/define.*DB_PASSWORD.*/define \( 'DB_PASSWORD', '$pass' \)/" -e "s/define.*DB_HOST.*/define \( 'DB_HOST', '$MYSQL4' \)/" $fp
			fi
	done
done

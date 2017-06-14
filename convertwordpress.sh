#!/bin/sh
TMPDIR="/tmp/jccmysql4tmpdir"
MYSQL4="mysql4.joes-cloud.com"
IPADDR=`grep IPADDR /etc/sysconfig/network-scripts/ifcfg-eth0 | awk -F= '{print $2}'| sed -e 's/"//g' -e "s/'//g"`
DBCOMMAND="$TMPDIR/dbcommand"
NEWDBDATA="$TMPDIR/configfilelist"

for i in `grep wp-config.php $NEWDBDATA`; do
	fp=`echo $i|cut -d: -f1`
	db=`echo $i|cut -d: -f2`
	pass=`echo $i|cut -d: -f3`
	fn=`basename $fp`
	sed -e "s/define.*DB_NAME.*/define \(d'DB_NAME', '$db' \)/" -e "s/define.*DB_USER.*/define \( 'DB_USER', '$db' \)/" -e "s/define.*DB_PASSWORD.*/define \( 'DB_PASSWORD', '$pass' \)/" -e "s/define.*DB_HOST.*/define \( 'DB_HOST', '$MYSQL4' \)/" $fp
done

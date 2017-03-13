#!/bin/sh

for user in `/bin/ls /var/cpanel/users`;do
  for f in `find /home/${user}/public_html -type f -name \.htaccess|xargs grep -l "^php_"`;do
    d=`echo $f|sed -e 's/\.htaccess//'`
    grep "^php_" $f|awk '{print $2" = "$3}' > ${d}php.ini
    chown $user:$user ${d}php.ini
    sed -i -e 's/^php_/#php_/' $f
  done
done

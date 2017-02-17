#!/bin/bash

cp -r /proftpd/* /etc/proftpd/

echo "" > ftpd.passwd
echo "" >> /proftpd/users
cat /proftpd/users | while read line;
do
	read -r -a array <<< "$line"
	echo "$line"
	echo "${array[1]}" | ftpasswd --passwd --name ${array[0]} --home ${array[2]} --shell /bin/false --uid 1000 --stdin
	mkdir -p ${array[2]}
done
mv ftpd.passwd /etc/proftpd
chmod -R 600 /etc/proftpd
/usr/sbin/proftpd -n -c /etc/proftpd/proftpd.conf

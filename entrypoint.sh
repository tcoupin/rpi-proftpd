#!/bin/bash


echo "" > ftpd.passwd
cat /users/* | while read line;
do
	read -r -a array <<< "$line"
	echo "$line: ${array[0]}/${array[1]}/${array[2]}"
	echo "${array[1]}" | ftpasswd --passwd --name ${array[0]} --home ${array[2]} --shell /usr/sbin/nologin --uid 1000 --stdin
	if [ ! -d ${array[2]} ]
	then
		mkdir -p ${array[2]}
		chown -R 1000:1000 ${array[2]}
	fi
	
done
mv ftpd.passwd /etc/proftpd
chmod -R 600 /etc/proftpd
exec "$@"

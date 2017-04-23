#!/bin/bash
# Author: Vladyslav Piskunov <vlad@assuredlabs.com>

clear
echo 'Welcome to Apache2 Virtual Host Creator!'
echo ''
echo 'Hosts will be created in:'
echo '/etc/apache2/sites-available'
echo '/etc/apache2/sites-enabled'
echo ''
echo ''

echo 'Please enter domain name:'
read domainName
if [ $domainName ]; then
	echo " ### Set domain name to: $domainName"
else
	echo ' ### ERROR: no Domain Name given! Exiting...'
	echo ''
	echo ''
	exit 0
fi


echo ''
echo 'Please enter which IP to listen at:[*]'
read ipaddress
if [ $ipaddress ]; then
        echo -e " ### Setting IP address to $ipaddress"
else
        echo " ### Setting IP adress to '*' (all IPs, default)"
	ipaddress='*'
fi

echo ''
echo 'Please enter which Port to listen at:[80]'
read port

if [ $port ]; then
	echo -e " ### Setting port to $port"
else
	echo " ### Setting port to 80 (default)"
	port='80'
fi

echo ''
echo ''

echo 'Please enter host root directory name(without /var/www/):'
read dirName
if [ $dirName ]; then
        echo ''
else
        echo ' ### ERROR: no ROOT Directory Name given! Exiting...'
	echo ''
	echo ''
	exit 0
fi

vhost="<VirtualHost $ipaddress:$port>
    ServerName $domainName
    ServerAlias www.$domainName
    DocumentRoot '/var/www/$dirName'
        <Directory />
            Require all granted
            Options -Indexes +FollowSymLinks +Includes +ExecCGI
            IndexIgnore css js fonts images
                AllowOverride All
            Order allow,deny
            Allow from all
        </Directory>
</VirtualHost>"



if [ ! -e "/etc/apache2/sites-available/generated-$domainName.conf" ]; then
	echo "$vhost" > /etc/apache2/sites-available/generated-$domainName.conf
else
	echo ' ### ERROR: sites-available => file exists already!'
	exit 0
fi
if [ ! -e "/etc/apache2/sites-enabled/generated-$domainName.conf" ]; then
	echo "$vhost" > /etc/apache2/sites-enabled/generated-$domainName.conf
else
        echo ' ### ERROR: sites-enabled => file exists already!'
        exit 0
fi

echo 'Restarting apache... Please wait...'
service apache2 restart

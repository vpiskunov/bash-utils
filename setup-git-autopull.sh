#!/bin/bash
# Author: Vladyslav Piskunov <vlad@assuredlabs.com>

clear
echo 'Welcome to Git Automatic Pull configurator!'
echo ''

if [[ $EUID -ne 0 ]]; then
	echo "ERROR: This script must be run as root" 1>&2
	echo ''
	exit 1
fi

echo 'Please enter the username Apache is running under[www-data]:'
read apacheuser
if [ ! $apacheuser ]; then
	apacheuser='www-data'
fi
echo " ### Defined Owner username to: $apacheuser"

APACHEDIR="$(sudo -u $apacheuser echo $HOME)"

echo " ### Defined ApacheDir to: $APACHEDIR"
echo ''
echo ''
DIRSEPARATOR="/"
echo "executing: sudo cp ~/.ssh $APACHEDIR$DIRSEPARATOR"
sudo cp ~/.ssh $APACHEDIR$DIRSEPARATOR

echo ''
echo ''
echo ''

echo 'Success!'
echo 'Your PHP shell_exec("git -c $dir pull") should work perfectly now!'
echo 'P.S. happy hacking ;)'

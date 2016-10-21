#!/bin/bash
# ------------------------------------------------------------------
# [Vladyslav Piskunov] Erlang installer for Fedora
#         for Middlesex University 2015 
#
# ------------------------------------------------------------------


if [[ $EUID -ne 0 ]]; then
	echo "ERROR: This script must be run as root
Please run 'sudo bash erlang.sh'!" 1>&2
	echo ''
	exit 1
fi


echo "Installing WGET..."
echo ""
yum install -y wget

echo "Temporary directory is: ~/tmp-erlang"
echo ""
mkdir ~/tmp-erlang
cd ~/tmp-erlang




echo "Downloading Erlang..."
#wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm

echo "##########################
Installation in progress...!"
#rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
yum install -y erlang
cd ~/
rm -Rf ~/tmp-erlang
echo ""

echo "Cleaned up TMP successfully! All done!"
echo "

############################################

Try opening erlang by typing 'erl'

############################################

Written by Vladyslav Piskunov © (vp365@live.mdx.ac.uk)
for Middlesex University 2015

############################################"

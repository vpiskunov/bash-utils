#!/bin/bash
# ------------------------------------------------------------------
# [Vladyslav Piskunov] Erlang installer for Fedora
#         for Middlesex University 2015
#
# ------------------------------------------------------------------

echo "###################################################################################"
echo "Please be Patient: Installation will start now.......and it will take some time :)"
echo "###################################################################################"

#Update the repositories

#sudo yum update && sudo yum upgrade

sudo yum -y install nano

echo -e "\n"

echo "Installed NANO $(tput bold)$(tput setaf 2)Sucessfully$(tput sgr0)"

echo -e "\n

############################################

Written by Vladyslav Piskunov © (vp365@live.mdx.ac.uk)
for Middlesex University 2015

############################################"

echo -e "\n"
echo "To use it, type \"nano FILENAME\", where FILENAME is the file name for existing or a new file you 
would 
like 
to create, including the file extension, e.g. 'nano mod.erl'" 


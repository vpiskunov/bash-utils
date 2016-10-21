#!/bin/bash

#Instructions to use this script 
#
#chmod +x SCRIPTNAME.sh
#
#sudo ./SCRIPTNAME.sh

echo "###################################################################################"
echo "Please be Patient: Installation will start now.......and it will take some time :)"
echo "###################################################################################"

#Update the repositories

sudo yum update && sudo yum upgrade

echo -e "\n"

echo "Installed NANO $(tput bold)$(tput setaf 2)Sucessfully$(tput sgr0)"
echo "To use it, type \"nano FILENAME\", where FILENAME is the file name for existing or a new file you would like 
to create, including the file extension, e.g. 'nano mod.erl'" 
echo -e "\n"

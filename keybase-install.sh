#!/bin/bash

##########################
# README FOR NEW USERS   #
##########################
#
# You need to enter these commands in a Debian terminal:
#
# 	bash <(wget -O - https://raw.githubusercontent.com/Laz88/KeybaseInstall/master/keybase-install.sh)
#
##########################
# SCRIPT BEGINS HERE     #
##########################


# Step 0: verify the user is not root (or else the script will fail)

if [ "$USER" == root ]; then
	echo "[USER check] = Failed"
	echo "Error -- this script cannot be executed with sudo. Try ./ instead."
	echo "Exiting..."
	exit
else
	echo "[USER check] = $USER"
fi

sudo apt update
sudo apt install curl -y
 if [ "`getconf LONG_BIT`" == "64" ];then
      curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
      sudo apt install ./keybase_amd64.deb -y
  else
      curl --remote-name https://prerelease.keybase.io/keybase_i386.deb
      sudo apt install ./keybase_i386.deb
  fi



echo "Enjoy your keybase."

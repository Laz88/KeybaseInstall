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


# Step 1: Update, upgrade, and install curl

sudo apt update
sudo apt upgrade -y -f
sudo apt install curl

# Step 2: Download Keybase installer
curl -O https://prerelease.keybase.io/keybase_amd64.deb
# if you see an error about missing `libappindicator1`
# from the next command, you can ignore it, as the
# subsequent command corrects it
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f

# Step 3: Remove the downloaded installer
rm keybase_amd64.deb

# Step 4: Run Keybase
run_keybase

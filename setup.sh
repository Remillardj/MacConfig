#!/bin/bash

GIT_EMAIL = "jaryd.remillard@gmail.com"
GIT_USERNAME = "Remillardj"

echo "Because I am tired of having to setup my new computer everytime."
echo "Run me with sudo!"
echo "Starting Setup script..."
cd ~/

echo "Setting DNS to Google..."
networksetup -setdnsservers Wi-Fi
networksetup -setdnsservers Wi-Fi 8.8.8.8

echo "Turning on firewall for essential use only..."
defaults write /Library/Preferences/com.apple.alf globalstate -int 2

echo "Making scripts folder..."
mkdir Scripts

echo "Making repository folder.."
mkdir Repo

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew doctor
brew update

echo "Set up Python 3.x.x and pip3..."
brew install python3
python3 get-pip.py

echo "Installing some Python libraries..."
pip3 install virtualenv
pip3 install pytest
pip3 install pymysql

echo "Installing and configuration git..."
brew install git

git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USERNAME

brew doctor
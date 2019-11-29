#!/bin/bash

GET_CWD=`pwd`

echo "Install xcode"
xcode-select —-install

echo "Install iterm2"
brew cask install iterm2

echo "Get oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

GIT_EMAIL = "jaryd.remillard@gmail.com"
GIT_USERNAME = "Remillardj"

mkdir Tech
cd Tech

echo "Because I am tired of having to setup my new computer everytime."
echo "Run me with sudo!"
echo "Starting Setup script..."
cd ~/

echo "Setting DNS to Google..."
networksetup -setdnsservers Wi-Fi 8.8.8.8
networksetup -setdnsservers Wi-Fi 8.8.4.4

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

echo "Install consolas because superior"
brew install cabextract
cd ~/Downloads
mkdir consolas
cd consolas
curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
cabextract PowerPointViewer.exe
cabextract ppviewer.cab
open CONSOLA*.TTF

brew doctor

cd $GET_CWD
cp -R dotfiles/* ~/

chsh -S /bin/zsh

echo "That's it for now..."

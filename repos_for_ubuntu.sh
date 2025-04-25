#!/bin/bash

# Repos to Add for Ubuntu-based Distros

stR="Setting up Repo for"

echo "Adding repos for Linux Mint 21.x (Ubuntu 22.04 LTS 'Jammy Jellyfish')" && echo


echo "Enabling Main, Universe, Restricted, & Multiverse repositories"
##sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
sudo add-apt-repository main universe restricted multiverse -y


echo "$stR Flat Remix"
sudo add-apt-repository ppa:daniruiz/flat-remix -y
sudo apt-key export 3066C9C9 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/flat-remix.gpg


echo "$stR Google Chrome"
##Reference: https://www.google.com/linuxrepositories/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/chrome-linux_signing_key.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/chrome-linux_signing_key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo rm /etc/apt/sources.list.d/google-chrome.list


echo "$stR LibreOffice"
sudo add-apt-repository ppa:libreoffice/ppa -y
sudo apt-key export 1378B444 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/libreoffice.gpg


echo "$stR Mesa Drivers"
sudo add-apt-repository ppa:kisak/kisak-mesa -y
sudo apt-key export 90935439 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/kisak-mesa.gpg


echo "$stR MKVToolNix"
##Reference: https://mkvtoolnix.download/downloads.html#ubuntu

sudo wget -O /etc/apt/trusted.gpg.d/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg

sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ $(grep '^DISTRIB_CODENAME=' /etc/upstream-release/lsb-release | cut -d'=' -f2) main
# deb-src [arch=amd64 signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ $(grep '^DISTRIB_CODENAME=' /etc/upstream-release/lsb-release | cut -d'=' -f2) main" >> /etc/apt/sources.list.d/mkvtoolnix.download.list'


echo "$stR OBS Studio"
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt-key export F425E228 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/obs.gpg


echo "$stR ONLYOFFICE"
##Reference: https://helpcenter.onlyoffice.com/installation/docs-community-install-ubuntu.aspx

curl -fsSL https://download.onlyoffice.com/GPG-KEY-ONLYOFFICE | gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --import
chmod 644 /tmp/onlyoffice.gpg
sudo mv /tmp/onlyoffice.gpg /etc/apt/trusted.gpg.d/
echo "deb [signed-by=/etc/apt/trusted.gpg.d/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main" | sudo tee /etc/apt/sources.list.d/onlyoffice.list


echo "$stR QOwnNotes"
##Reference: https://www.qownnotes.org/installation/ubuntu.html

sudo add-apt-repository ppa:pbek/qownnotes -y
sudo apt-key export 47878405 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/qownnotes.gpg


echo "$stR Spotify"
##Reference: https://www.spotify.com/uk/download/linux/

curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "d
eb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list


echo "$stR Strawberry Music Player"
sudo add-apt-repository ppa:jonaski/strawberry -y
# alt for Strawberry unstable
# sudo add-apt-repository ppa:jonaski/strawberry-unstable
sudo apt-key export 99EA819D | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/strawberry.gpg


echo "$stR UbuntuHandbook & UbuntuHandbook (GIMP & Handbrake)"
# sudo add-apt-repository ppa:ubuntuhandbook1/apps -y
# sudo add-apt-repository ppa:ubuntuhandbook1/gimp -y
sudo add-apt-repository ppa:ubuntuhandbook1/handbrake -y
sudo apt-key export 852541CB | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/ubuntuhandbookapps1.gpg


echo "$stR VSCode"
# Reference: https://code.visualstudio.com/docs/setup/linux

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
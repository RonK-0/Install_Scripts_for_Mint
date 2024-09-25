#!/bin/bash
#Var list
in="Installing"
stR="Setting up Repo for"
remo="Removing"

#REPOS#

#echo "$stR Atom"
#curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
#sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

#echo "$stR Celluloid"
#sudo add-apt-repository ppa:xuzhen666/gnome-mpv -y

#echo "$stR Handbrake"
#sudo add-apt-repository ppa:stebbins/handbrake-releases -y

##Dropped Ref:https://www.reddit.com/r/linux/comments/wmnir4/krita_officially_no_longer_supports_package/
#echo "$stR Krita"
#sudo add-apt-repository ppa:kritalime/ppa -y

#echo "$stR Moka & Paper Icon Themes & Suru Icon Set"
#sudo add-apt-repository ppa:snwh/ppa -y

#echo "$stR Numix Theme"
#sudo add-apt-repository ppa:numix/ppa -y

#echo "$stR PopOS Repo for PopOS Theme"
#sudo add-apt-repository ppa:system76/pop -y

#echo "$stR SimpleScreenRecorder"
#sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y

##echo "$stR Shutter"
##sudo add-apt-repository ppa:linuxuprising/shutter -y

##echo "$stR Transmission BT"
##sudo add-apt-repository ppa:transmissionbt/ppa -y

#echo "$stR VSCodium"
##Reference: https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo

#curl -sS https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/vscodium-archive-keyring.gpg
#echo 'deb [ signed-by=/etc/apt/trusted.gpg.d/vscodium-archive-keyring.gpg ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' \
#    | sudo tee /etc/apt/sources.list.d/vscodium.list

#alt to get key
#wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/vscodium-archive-keyring.gpg

#APPS#

#echo "$in Arc Theme"
#sudo apt install arc-theme -y

##replaced with VSCodium
#echo "$in Atom"
#sudo apt-get install atom -y

#echo "$in Blackbird Theme"
#sudo apt install blackbird-gtk-theme -y

#echo "$in Breeze Theme and Icons"
#sudo apt install breeze-gtk-theme breeze-icon-theme -y

#echo "$in Clementine"
#sudo apt install clementine -y

#echo "$in Deepin Icon Theme"
#sudo apt install deepin-icon-theme -y

##switched to more updated flatpak version
#echo "$in Handbrake"
#sudo apt install handbrake -y

#echo "$in La Capitaine"
#cd ~/.icons
#git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
#cd ~

#echo "$in Lollypop (flatpak)"
#flatpak install org.gnome.Lollypop -y

#echo "$in Mark Text (flatpak)"
#flatpak install com.github.marktext.marktext -y

#echo "$in Moka & Paper Icon Themes & Suru Icon Set"
#sudo apt install moka-icon-theme paper-icon-theme suru-icon-set -y

##replaced by Xed (default in Mint)
#echo "$in Notepadqq (flatpak)"
#flatpak install com.notepadqq.Notepadqq -y

#echo "$in Numix Themes and Icons"
#sudo apt install numix-blue-gtk-theme numix-gtk-theme numix-icon-theme numix-icon-theme-circle numix-icon-theme-square -y

#echo "$in PDfmod"
#sudo apt install pdfmod -y

#echo "$in PopOS Theme"
#sudo apt install pop-theme -y

##replaced with Linux Mint built-in mintstick tool
#echo "$in Popsicle (flatpak)"
#flatpak install com.system76.Popsicle -y

#echo "$in SimpleScreenRecorder"
#sudo apt install simplescreenrecorder -y

##switched to apt-ppa version due to theming issue
#echo "$in Strawberry (flatpak)"
#flatpak install org.strawberrymusicplayer.strawberry -y

##replaced with VSCode
#echo "$in VSCodium"
#sudo apt-get install codium -y

##replaced with qBittorrent
#echo $in Transmission
#sudo apt install transmission transmission-gtk transmission-qt -y

##superseeded by yt-dlp
#echo "$in youtube-dl"
##From binary (curl)
#sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
#sudo chmod a+rx /usr/local/bin/youtube-dl
#youtube-dl -U
##From binary (wget)
#sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
#sudo chmod a+rx /usr/local/bin/youtube-dl

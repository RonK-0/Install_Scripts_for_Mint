#!/bin/bash
#Var list
in="Installing"
stR="Setting up Repo for"
remo="Removing"
line="--------------------------------------------------------------------------------"

# Reusable functions
# shorthand for 'apt install'
apt_ins() {
    sudo apt install -y "$@"
    echo
}
# shorthand for 'apt remove'
apt_rem() {
    sudo apt remove -y "$@"
    echo
}
# shorthand for 'apt purge'
apt_purge() {
    sudo apt purge -y "$@"
    echo
}
# shorthand for section divider
next_sec() {
    echo "$line"
    echo
    echo "$line"
}


#Start
echo "Script for auto setup of Repositories, Removal of some Preinstalled Apps, Installing Apps and Updates."
echo "Targeted for Linux Mint 21.x and LMDE 6"

echo "Check for Updates, Install Updates, and Remove unneeded packages"
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y


next_sec


echo "Removing some Preinstalled Apps"

echo "$remo Drawing"
apt_purge "drawing"

echo "$remo Hexchat"
apt_purge "hexchat"

echo "$remo Hypnotix"
apt_purge "hypnotix"

echo "$remo Redshift"
apt_purge "redshift"

echo "$remo Rhythmbox"
apt_purge "rhythmbox"

echo "$remo Simple Scan"
apt_purge "simple-scan"

echo "$remo Thunderbird"
apt_purge "thunderbird"

echo "$remo Transmission"
apt_purge "transmission transmission-gtk transmission-qt"

echo "Removing some Preinstalled Apps. DONE"


next_sec


echo "Setting up Repos"

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
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ jammy main
# deb-src [arch=amd64 signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ jammy main" >> /etc/apt/sources.list.d/mkvtoolnix.download.list'


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


echo "Setting up Repos. DONE"

next_sec

echo "Check for Updates"
sudo apt update

echo "Check for Updates. DONE"

next_sec

echo "$in Dependencies"

echo "$in Flatpak"
apt_ins "flatpak"

echo "$in Flatseal (Flatpak permissions manager)"
flatpak install com.github.tchx84.Flatseal -y

echo "$in Python & Python-pip"
apt_ins "python python-pip-whl"

echo "$in Cargo (Rust Package Manager)"
apt_ins "cargo"

echo "$in Font Forge (requirement for Vista Fonts)"
apt_ins "fontforge"

echo "$in Git"
apt_ins "git"

echo "$in ffmpeg"
apt_ins "ffmpeg"

apt_ins "curl wget"

echo "Dependencies. DONE"


next_sec


echo "$in Apps"

echo "$in Android Tools"
apt_ins "adb fastboot mkbootimg"

echo "$in Audacity"
apt_ins "audacity"

echo "$in Bleachbit"
apt_ins "bleachbit"

echo "$in Celluloid"
apt_ins "celluloid"

#echo "$in Darktable"
#flatpak install org.darktable.Darktable -y

echo "$in Flat Remix Icon Theme"
apt_ins "flat-remix"

# echo "$in GIMP"
# apt_ins "gimp gimp-gmic"

echo "$in GNOME System Monitor"
apt_ins "gnome-system-monitor"

echo "$in Google Chrome"
apt_ins "google-chrome-stable "

echo "$in Gparted"
apt_ins "gparted "

# echo "$in Handbrake (Official flatpak)"
# flatpak install fr.handbrake.ghb -y
# flatpak override --user --filesystem=home fr.handbrake.ghb

echo "$in Handbrake (from distro repo or UbuntuHandbook)"
apt_ins "handbrake handbrake-cli"

echo "$in Htop"
apt_ins "htop "

echo "$in httrack"
apt_ins "httrack"

echo "$in Krita"
apt_ins "krita"

echo "$in LibreOffice"
apt_ins "libreoffice"

echo "$in LibreWolf (hardened Firefox fork)"
flatpak io.gitlab.librewolf-community -y

echo "$in Mcomix"
apt_ins "mcomix"

echo "$in MKVToolNix"
apt_ins "mkvtoolnix mkvtoolnix-gui"

echo "$in Microsoft TrueType Core Fonts"
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
apt_ins "ttf-mscorefonts-installer"

echo "$in Nemo gtkhash extension"
apt_ins "nemo-gtkhash"

echo "$in OBS Studio"
apt_ins "obs-studio v4l2loopback-dkms"

echo "$in ONLYOFFICE Desktop Editors"
apt_ins "onlyoffice-desktopeditors onlyoffice-documentbuilder"

echo "$in Papirus Icon Theme"
apt_ins "papirus-icon-theme"

echo "$in Pulse Audio Volume Control"
apt_ins "pavucontrol"

echo "$in Piper (libratbag frontend) for Logitech device config"
#https://github.com/libratbag/piper/wiki/Installation
apt_ins "piper"

echo "$in Plank Dock"
apt_ins "plank"

echo "$in Puddletag"
apt_ins "puddletag"

echo "$in qBittorrent"
apt_ins "qbittorrent"

echo "$in QOwnNotes"
apt_ins "qownnotes"

echo "$in Remmina Remote Desktop Client"
flatpak install org.remmina.Remmina -y

echo "$in Spotify"
apt_ins "spotify-client"

echo "$in Strawberry"
apt_ins "strawberry"

echo "$in Synaptic Package Manager"
apt_ins "synaptic"

echo "$in VeraCrypt"
apt_ins "veracrypt"

echo "$in Virt Manager"
apt_ins "virt-manager"

echo "$in Vista Fonts"
cd ./Vista_Fonts_Installer/
chmod 755 ttf-vista-fonts-installer.sh
sudo ./ttf-vista-fonts-installer.sh
cd ..

echo "$in VSCode"
apt_ins "apt-transport-https code"

echo "$in yt-dlp"
## curl method
# sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
## wget method
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
sudo yt-dlp --update-to nightly
# sudo yt-dlp --update-to master

echo "$in Apps. DONE"


next_sec


echo "Linux Mint Scroll Fix (based on https://forums.linuxmint.com/viewtopic.php?p=1641324#p1641324)"
apt_ins "imwheel zenity"
mkdir ~/.local/bin
wget http://www.nicknorton.net/mousewheel.sh -O ./mousewheel.sh
chmod 755 ./mousewheel.sh
cp ./mousewheel.sh ~/.local/bin/mousewheel.sh
chmod u+x ~/.local/bin/mousewheel.sh
echo -e "[Desktop Entry]\nName=Mouse Wheel Adjustment\nExec=mousewheel.sh\nComment=\nTerminal=false\nIcon=mouse\nType=Application" > $(xdg-user-dir DESKTOP)/mousewheel.desktop
chmod u+x $(xdg-user-dir DESKTOP)/mousewheel.desktop
echo -e "[Desktop Entry]\nName=imwheel\nExec=imwheel\nX-GNOME-Autostart-enabled=true\nNoDisplay=false\nHidden=false\nComment=Activates wheel scroll speed fix on system startup\nX-GNOME-Autostart-Delay=0\nType=Application" > ~/.config/autostart/imwheel.desktop


next_sec


# Optional Stuff | START

# echo "Spotify Adblock"
# chmod 755 spotify_adblock.sh
# ./spotify_adblock.sh

# echo "Installing Console Emulators"
# chmod 755 install_emulators.sh
# ./install_emulators.sh

# Optional Stuff | END


next_sec


echo "$in Updates"
sudo apt upgrade -y

echo "$in Updates. DONE"


next_sec


echo "$remo Unneeded Packages and Dependencies"
sudo apt purge fontforge -y

sudo apt autoremove -y

echo "$remo Unneeded Packages and Dependencies. DONE"


next_sec


echo "DONE!"
#End
#!/bin/bash
line="--------------------------------------------------------------------------------"
is_Ubuntu=0
is_Debian=0

# Reusable functions
# shorthand for 'apt install'
apt_ins() {
    echo "Installing ""$1" && shift
    sudo apt install -s "$@"
    echo
}

# shorthand for 'apt remove'
apt_rem() {
    echo "Removing ""$1" && shift
    sudo apt remove -y "$@"
    echo
}

# shorthand for 'apt purge'
apt_purge() {
    echo "Purging ""$1" && shift
    sudo apt purge -s "$@"
    echo
}

# shorthand for 'flatpak install'
fp_ins() {
    echo "Installing ""$1" && shift
    flatpak install -y "$@"
    echo
}

# shorthand for 'flatpak remove'
fp_rem() {
    echo "Removing ""$1" && shift
    flatpak remove -y "$@"
    echo
}

# shorthand for section divider
next_sec() {
    echo "$line" && echo && echo "$line"
}


# Script Start
echo "Script for auto setup of Repositories, Removal of some Preinstalled Apps, Installing Apps and Updates."
echo "Targeted for Linux Mint 22.x (based on Ubuntu 24.04 LTS 'Noble Numbat') and LMDE 7 Gigi (based on Debian 13 'Trixie')" && echo
read -p "Press Enter to continue" && echo


# Distro Check
distro_info=$(hostnamectl | grep "Operating System")

if echo "$distro_info" | grep -qiE "Linux Mint|Ubuntu"; then
    is_Ubuntu=1
elif echo "$distro_info" | grep -qiE "LMDE|Debian"; then
    is_Debian=1
else
    echo "Your Operating System is $(echo "$distro_info" | cut -d ':' -f2- | xargs)"
    echo "It might be incompatible with this script as its meant for Linux Mint or Ubuntu & LMDE or Debian distros."
    exit 0
fi


echo "Check for Updates, Install Updates, and Remove unneeded packages"
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
echo


next_sec


echo "Removing some Preinstalled Apps" && echo

apt_purge "Drawing" drawing
apt_purge "Hexchat" hexchat
apt_purge "Hypnotix" hypnotix
apt_purge "Redshift" redshift
apt_purge "Rhythmbox" rhythmbox
apt_purge "Simple Scan" simple-scan
apt_purge "Thunderbird" thunderbird
apt_purge "Transmission" transmission transmission-gtk transmission-qt

echo && echo "Removing some Preinstalled Apps. DONE"


next_sec


echo "Setting up Repos" && echo

if [ $is_Ubuntu -eq 1 ]; then
    chmod 755 repos_for_ubuntu.sh
    ./repos_for_ubuntu.sh

elif [ $is_Debian -eq 1 ]; then
    chmod 755 repos_for_debian.sh
    ./repos_for_debian.sh
fi
echo && echo "Setting up Repos. DONE"


next_sec


echo "Check for Updates" && echo
sudo apt update
echo && echo "Check for Updates. DONE"


next_sec


echo "$in Dependencies" && echo

apt_ins "Flatpak" flatpak
fp_ins "Flatseal (Flatpak permissions manager)" com.github.tchx84.Flatseal
apt_ins "Python & Python-pip" python3 python3-pip python3-pip-whl
apt_ins "Cargo (Rust Package Manager)" cargo
apt_ins "Font Forge (requirement for Vista Fonts)" fontforge
apt_ins "Git" git
apt_ins "ffmpeg" ffmpeg
apt_ins "curl & wget" curl wget
apt_ins "Synaptic Package Manager" synaptic

echo && echo "Dependencies. DONE"


next_sec


echo "$in Apps" && echo

apt_ins "Android Tools" adb fastboot mkbootimg

apt_ins "Audacity" audacity

apt_ins "Bleachbit" bleachbit

apt_ins "Celluloid" celluloid

#fp_ins #"Darktable" org.darktable.Darktable

apt_ins "Flat Remix Icon Theme" flat-remix

# apt_ins "GIMP" "gimp gimp-gmic"

apt_ins "GNOME System Monitor" gnome-system-monitor

apt_ins "Google Chrome" google-chrome-stable 

apt_ins "GParted" gparted

# fp_ins "Handbrake (Official flatpak)" fr.handbrake.ghb
# flatpak override --user --filesystem=home fr.handbrake.ghb
apt_ins "Handbrake (from distro repo or UbuntuHandbook)" handbrake handbrake-cli

apt_ins "Htop" htop

apt_ins "httrack" httrack

apt_ins "Krita" krita

apt_ins "LibreOffice" libreoffice

fp_ins "LibreWolf (hardened Firefox fork)" io.gitlab.librewolf-community

apt_ins "Mcomix" mcomix

apt_ins "MKVToolNix" mkvtoolnix mkvtoolnix-gui

fp_ins "Mission Center" io.missioncenter.MissionCenter

apt_ins "Nemo gtkhash extension" nemo-gtkhash

apt_ins "OBS Studio" obs-studio v4l2loopback-dkms

apt_ins "ONLYOFFICE Desktop Editors" "onlyoffice-desktopeditors onlyoffice-documentbuilder"

apt_ins "Papirus Icon Theme" papirus-icon-theme

apt_ins "Pulse Audio Volume Control" pavucontrol
# might remove in the future
# unecessary on Mint 22 and later since the default Pipewire instead of Pulse Audio

apt_ins "Plank Dock" plank

apt_ins "Puddletag" puddletag

apt_ins "qBittorrent" qbittorrent

apt_ins "QOwnNotes" qownnotes

fp_ins "Remmina Remote Desktop Client" org.remmina.Remmina

apt_ins "Spotify" spotify-client

apt_ins "Strawberry" strawberry

apt_ins "VeraCrypt" veracrypt

apt_ins "Virt Manager" virt-manager

apt_ins "VSCode" apt-transport-https code

echo && echo "$in Apps. DONE"


next_sec


# Optional Stuff | START

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
apt_ins "Microsoft TrueType Core Fonts" ttf-mscorefonts-installer

cd "Vista Fonts" "./Vistapt_Fonts_Installer/"
chmod 755 ttf-vista-fonts-installer.sh
sudo ./ttf-vista-fonts-installer.sh
cd ..

echo "Linux Mint Scroll Fix (based on https://forums.linuxmint.com/viewtopic.php?p=1641324#p1641324)"
chmod 755 mint_scroll_fix.sh
./mint_scroll_fix.sh

echo "yt-dlp"
## curl meythod
# sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
## wget method
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
sudo yt-dlp --update-to nightly
# sudo yt-dlp --update-to master

#https://github.com/libratbag/piper/wiki/Installation
apt_ins "Piper (libratbag frontend) for Logitech device config" piper

# echo "Spotify Adblock"
# chmod 755 spotify_adblock.sh
# ./spotify_adblock.sh

# echo "Installing Console Emulators"
# chmod 755 install_emulators.sh
# ./install_emulators.sh

# Optional Stuff | END


next_sec


echo "$in Updates" && echo
sudo apt upgrade -y
echo && echo "$in Updates. DONE"


next_sec


echo "$remo Unneeded Packages and Dependencies" && echo
apt_purge "FontForge" fontforge
sudo apt autoremove -y
echo && echo "$remo Unneeded Packages and Dependencies. DONE"


next_sec


echo "DONE!"
# Script End
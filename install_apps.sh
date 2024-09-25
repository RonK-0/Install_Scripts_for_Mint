#!/bin/bash
#Var list
in="Installing"
stR="Setting up Repo for"
remo="Removing"

#Start
echo "Script for auto setup of Repositories, Remove some Preinstalled Apps, Install Apps and Updates."
echo "Targeted for Linux Mint 21.x"

echo "Check for Updates, Install Updates, and Remove unneeded"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "Removing some Preinstalled Apps"

echo "$remo Drawing"
sudo apt remove drawing -y

echo "$remo Hexchat"
sudo apt remove hexchat -y

echo "$remo Hypnotix"
sudo apt remove hypnotix -y

echo "$remo Redshift"
sudo apt remove redshift -y

echo "$remo Rhythmbox"
sudo apt remove rhythmbox -y

echo "$remo Simple Scan"
sudo apt remove simple-scan -y

echo "$remo Thunderbird"
sudo apt remove thunderbird -y

echo "$remo Transmission"
sudo apt remove transmission transmission-gtk transmission-qt -y

echo "Removing some Preinstalled Apps. DONE"

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "Setting up Repos"

echo "Enabling Main, Universe, Restricted, & Multiverse repositories"
##sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
sudo add-apt-repository main universe restricted multiverse -y

echo "$stR Flat Remix"
sudo add-apt-repository ppa:daniruiz/flat-remix -y
#sudo sh -c 'echo "deb http://ppa.launchpad.net/daniruiz/flat-remix/ubuntu jammy main
# deb-src http://ppa.launchpad.net/daniruiz/flat-remix/ubuntu jammy main" >> /etc/apt/sources.list.d/daniruiz-flat-remix-jammy.list'
sudo apt-key export 3066C9C9 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/flat-remix.gpg

echo "$stR Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/chrome-linux_signing_key.gpg
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo rm /etc/apt/sources.list.d/google-chrome.list

echo "$stR Inkscape"
sudo add-apt-repository ppa:inkscape.dev/stable -y
#sudo sh -c 'echo "deb http://ppa.launchpad.net/inkscape.dev/stable/ubuntu jammy main
# deb-src http://ppa.launchpad.net/inkscape.dev/stable/ubuntu jammy main" >> /etc/apt/sources.list.d/inkscape_dev-stable-jammy.list'
sudo apt-key export B9A06DE3 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/inkscape.gpg

echo "$stR LibreOffice"
sudo add-apt-repository ppa:libreoffice/ppa -y
#sudo sh -c 'echo "deb http://ppa.launchpad.net/libreoffice/ppa/ubuntu jammy main
# deb-src http://ppa.launchpad.net/libreoffice/ppa/ubuntu jammy main" >> /etc/apt/sources.list.d/libreoffice-ppa-jammy.list'
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
#sudo sh -c 'echo "deb http://ppa.launchpad.net/obsproject/obs-studio/ubuntu jammy main
# deb-src http://ppa.launchpad.net/obsproject/obs-studio/ubuntu jammy main" >> /etc/apt/sources.list.d/pbek-obsproject-obs-studio-jammy.list'
sudo apt-key export F425E228 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/obs.gpg

echo "$stR ONLYOFFICE"
##Reference: https://helpcenter.onlyoffice.com/installation/docs-community-install-ubuntu.aspx

#gpg keyring: 8320CA65CB2DE8E5
gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
chmod 644 /tmp/onlyoffice.gpg
sudo mv /tmp/onlyoffice.gpg /etc/apt/trusted.gpg.d/
echo "deb https://download.onlyoffice.com/repo/debian squeeze main" | sudo tee /etc/apt/sources.list.d/onlyoffice.list

#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
#sudo apt-key export CB2DE8E5 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/onlyoffice.gpg

echo "$stR QOwnNotes"
##Reference: https://www.qownnotes.org/installation/ubuntu.html
sudo add-apt-repository ppa:pbek/qownnotes -y
#sudo sh -c 'echo "deb http://ppa.launchpad.net/pbek/qownnotes/ubuntu jammy main
# deb-src http://ppa.launchpad.net/pbek/qownnotes/ubuntu jammy main" >> /etc/apt/sources.list.d/pbek-qownnotes-jammy.list'
sudo apt-key export 47878405 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/qownnotes.gpg

echo "$stR Spotify"
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

echo "$stR Strawberry Music Player"
#sudo add-apt-repository ppa:jonaski/strawberry -y
sudo sh -c 'echo "deb http://ppa.launchpad.net/jonaski/strawberry/ubuntu jammy main
 deb-src http://ppa.launchpad.net/jonaski/strawberry/ubuntu jammy main" >> /etc/apt/sources.list.d/pbek-jonaski-strawberry-jammy.list'
sudo apt-key export 99EA819D | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/strawberry.gpg

echo "$stR UbuntuHandbook & UbuntuHandbook (GIMP)"
sudo add-apt-repository ppa:ubuntuhandbook1/apps -y
sudo add-apt-repository ppa:ubuntuhandbook1/gimp -y
sudo apt-key export 852541CB | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/ubuntuhandbookapps1.gpg

echo "$stR VSCode"
# Reference: https://code.visualstudio.com/docs/setup/linux
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

echo "Setting up Repos. DONE"

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "Check for Updates"
sudo apt-get update

echo "Check for Updates. DONE"

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "$in Apps"

echo "$in Android Tools"
sudo apt-get install adb fastboot android-tools-mkbootimg -y

echo "$in Audacity"
sudo apt-get install audacity -y

#echo "$in Flatpak"
#sudo apt-get install flatpak -y

echo "$in Bleachbit"
sudo apt-get install bleachbit -y

echo "$in Cargo (Rust Package Manager)"
sudo apt-get install cargo -y

echo "$in Celluloid"
sudo apt-get install celluloid -y

#echo "$in Darktable"
#flatpak install org.darktable.Darktable -y

echo "$in ffmpeg"
#edit to add nvenc, nvdec, cuda, cuvid, vulkan, etc as in https://www.gyan.dev/ffmpeg/builds/#libraries
sudo apt-get install ffmpeg -y

##Compiling ffmpeg with nvidia stuff (based on: https://docs.nvidia.com/video-technologies/video-codec-sdk/ffmpeg-with-nvidia-gpu/)
#git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
#cd nv-codec-headers && sudo make install && cd –
#git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg/
#sudo apt-get install build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev -y
#./configure --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64 --disable-static --enable-shared
#make -j 8
#sudo make install
#cd ~


echo "$in Flat Remix Icon Theme"
sudo apt-get install flat-remix -y

echo "$in Font Forge (requirement for Vista Fonts)"
sudo apt-get install fontforge -y

echo "$in git"
sudo apt-get install git -y

echo "$in GIMP"
sudo apt-get install gimp gimp-gmic -y

#echo "$in GIMP (flatpak)"
#flatpak install org.gimp.GIMP -y

echo "$in Git"
sudo apt-get install git -y

echo "$in GNOME System Monitor"
sudo apt-get install gnome-system-monitor -y

echo "$in Google Chrome"
sudo apt-get install google-chrome-stable  -y

echo "$in Gparted"
sudo apt-get install gparted  -y

echo "$in Handbrake (flatpak)"
flatpak install fr.handbrake.ghb -y
flatpak override --user --filesystem=home fr.handbrake.ghb

echo "$in Htop"
sudo apt-get install htop  -y

echo "$in httrack"
sudo apt-get install httrack -y

echo "$in Inkscape"
sudo apt-get install inkscape -y

echo "$in Krita"
sudo apt-get install krita -y

#echo "$in Krita (flatpak)"
#flatpak install org.kde.krita -y

echo "$in LibreOffice"
sudo apt-get install libreoffice -y

echo "$in Mcomix"
sudo apt-get install mcomix -y

echo "$in MKVToolNix"
sudo apt-get install mkvtoolnix mkvtoolnix-gui -y

echo "$in Microsoft TrueType Core Fonts"
#sudo apt-get install ttf-mscorefonts-installer -y
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install ttf-mscorefonts-installer -y

echo "$in Nemo gtkhash extension"
sudo apt-get install nemo-gtkhash -y

echo "$in OBS Studio"
sudo apt-get install obs-studio v4l2loopback-dkms -y

echo "$in ONLYOFFICE Desktop Editors"
sudo apt-get install onlyoffice-desktopeditors onlyoffice-documentbuilder -y

echo "$in Papirus Icon Theme"
sudo apt-get install papirus-icon-theme -y

echo "$in Pulse Audio Volume Control"
sudo apt-get install pavucontrol -y

echo "$in Pinta (flatpak)"
flatpak install com.github.PintaProject.Pinta -y

echo "$in Piper (libratbag frontend) for Logitech device config"
#https://github.com/libratbag/piper/wiki/Installation
sudo apt-get piper -y

echo "$in Plank Dock"
sudo apt-get install plank -y

echo "$in Puddletag"
sudo apt-get install puddletag -y

echo "$in Python & Python-pip"
sudo apt-get install python python-pip-whl -y

echo "$in qBittorrent"
sudo apt-get install qbittorrent -y

echo "$in QOwnNotes"
sudo apt-get install qownnotes -y

echo "$in Spotify"
sudo apt-get install spotify-client -y

#echo "$in Strawberry (flatpak)"
#flatpak install org.strawberrymusicplayer.strawberry -y

echo "$in Strawberry"
sudo apt-get install strawberry -y

echo "$in Synaptic Package Manager"
sudo apt-get install synaptic -y

echo "$in Thonny IDE"
sudo apt-get install thonny -y

echo "$in Vista Fonts"
cd ./Vista_Fonts_Installer/
chmod 755 ttf-vista-fonts-installer.sh
sudo ./ttf-vista-fonts-installer.sh
cd ..

echo "$in VSCode"
sudo apt install apt-transport-https code -y

echo "$in yt-dlp"
##From binary (curl)
#sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
##From binary (wget)
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
yt-dlp -U


echo "$in Apps. DONE"

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "Linux Mint Scroll Fix (based on https://forums.linuxmint.com/viewtopic.php?p=1641324#p1641324)"
sudo apt-get install imwheel zenity -y
mkdir ~/.local/bin
wget http://www.nicknorton.net/mousewheel.sh -O ./mousewheel.sh
chmod 755 ./mousewheel.sh
cp ./mousewheel.sh ~/.local/bin/mousewheel.sh
chmod u+x ~/.local/bin/mousewheel.sh
echo -e "[Desktop Entry]\nName=Mouse Wheel Adjustment\nExec=mousewheel.sh\nComment=\nTerminal=false\nIcon=mouse\nType=Application" > $(xdg-user-dir DESKTOP)/mousewheel.desktop
chmod u+x $(xdg-user-dir DESKTOP)/mousewheel.desktop
echo -e "[Desktop Entry]\nName=imwheel\nExec=imwheel\nX-GNOME-Autostart-enabled=true\nNoDisplay=false\nHidden=false\nComment=Activates wheel scroll speed fix on system startup\nX-GNOME-Autostart-Delay=0\nType=Application" > ~/.config/autostart/imwheel.desktop

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

# echo "Spotify Adblock"
# chmod 755 spotify_adblock.sh
# ./spotify_adblock.sh

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "$in Updates"
sudo apt-get upgrade -y

echo "$in Updates. DONE"

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "$remo Unneeded Packages and Dependencies"
sudo apt purge fontforge -y

sudo apt autoremove -y

echo "$remo Unneeded Packages and Dependencies. DONE"

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "DONE!"
#End
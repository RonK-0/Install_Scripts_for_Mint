#!/bin/bash
#Var list
in="Installing"
stR="Setting up Repo for"
remo="Removing"

#Start
echo "Script for auto setup of Repositories, Remove some Preinstalled Apps, Install Apps and Updates."
echo "Targeted for Linux Mint 20.x"

echo "Check for Updates, Install Updates, and Remove unneeded"
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

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

echo "$stR Celluloid"
sudo add-apt-repository ppa:xuzhen666/gnome-mpv -y

echo "$stR Flat Remix"
sudo add-apt-repository ppa:daniruiz/flat-remix -y

echo "$stR GIMP"
sudo add-apt-repository ppa:ubuntuhandbook1/gimp -y

echo "$stR Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
cd /etc/apt/sources.list.d
sudo rm google-chrome.list
cd ~

echo "$stR Krita"
sudo add-apt-repository ppa:kritalime/ppa -y

echo "$stR Inkscape"
sudo add-apt-repository ppa:inkscape.dev/stable -y

echo "$stR LibreOffice"
sudo add-apt-repository ppa:libreoffice/ppa -y

echo "$stR Mesa Drivers"
sudo add-apt-repository ppa:kisak/kisak-mesa -y

echo "$stR MKVToolNix"
##Reference: https://mkvtoolnix.download/downloads.html#ubuntu
sudo wget -O /usr/share/keyrings/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ focal main" >> /etc/apt/sources.list.d/mkvtoolnix.download.list'

echo "$stR OBS Studio"
sudo add-apt-repository ppa:obsproject/obs-studio -y

echo "$stR ONLYOFFICE"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
echo "deb https://download.onlyoffice.com/repo/debian squeeze main" | sudo tee /etc/apt/sources.list.d/onlyoffice.list

echo "$stR QOwnNotes"
##Reference: https://www.qownnotes.org/installation/ubuntu.html
sudo add-apt-repository ppa:pbek/qownnotes -y

echo "$stR Spotify"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

echo "$stR UbuntuHandbook"
sudo add-apt-repository ppa:ubuntuhandbook1/apps -y

echo "$stR VSCodium"
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

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
sudo apt-get install android-tools-adb android-tools-fastboot android-tools-mkbootimg -y

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

echo "$in Darktable"
flatpak install org.darktable.Darktable -y

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

#echo "$in GIMP (flatpak)"
#flatpak install org.gimp.GIMP -y

echo "$in GIMP"
sudo apt-get install gimp gimp-gmic

echo "$in GNOME System Monitor"
sudo apt-get install gnome-system-monitor -y

echo "$in Google Chrome"
sudo apt-get install google-chrome-stable  -y

echo "$in Gparted"
sudo apt-get install gparted  -y

echo "$in Handbrake (flatpak)"
flatpak install fr.handbrake.ghb -y

echo "$in Htop"
sudo apt-get install htop  -y

echo "$in httrack"
sudo apt-get install httrack -y

echo "$in Inkscape"
sudo apt-get install inkscape -y

echo "$in Krita"
sudo apt-get install krita -y

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
sudo apt-get install obs-studio -y

echo "$in ONLYOFFICE Desktop Editors"
sudo apt-get install onlyoffice-desktopeditors onlyoffice-documentbuilder -y

echo "$in Papirus Icon Theme"
sudo apt-get install papirus-icon-theme -y

echo "$in Pulse Audio Volume Control"
sudo apt-get install pavucontrol -y

echo "$in Pinta (flatpak)"
flatpak install com.github.PintaProject.Pinta -y

echo "$in Plank Dock"
sudo apt-get install plank -y

echo "$in Popsicle (flatpak)"
flatpak install com.system76.Popsicle -y

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

echo "$in Strawberry (flatpak)"
flatpak install org.strawberrymusicplayer.strawberry -y

echo "$in Synaptic Package Manager"
sudo apt-get install synaptic -y

echo "$in Thonny IDE"
sudo apt-get install thonny -y

echo "$in Vista Fonts"
cd ./Vista_Fonts_Installer/
chmod 755 ttf-vista-fonts-installer.sh
sudo ./ttf-vista-fonts-installer.sh
cd ..

echo "$in VSCodium"
sudo apt-get install codium -y

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

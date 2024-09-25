#!/bin/bash

echo "Install Spotify Adblock"
echo "---- Based on https://github.com/abba23/spotify-adblock ----"

echo "Step 1: Install Spotify Adblock from git"
cd ~
git clone https://github.com/abba23/spotify-adblock.git
cd spotify-adblock
make
sudo make install
cd ~

echo "Step 2: Creating Spotify (Adblock) shorcut"
cd ~/.local/share/applications
cat > spotify-adblock.desktop << EOF
[Desktop Entry]
Type=Application
Name=Spotify (Adblock)
GenericName=Music Player
Icon=spotify-client
TryExec=spotify
Exec=env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U
Terminal=false
MimeType=x-scheme-handler/spotify;
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=spotify
EOF

echo "Step 3: Cleanup"
cd ~
sudo rm -dr ~/spotify-adblock

echo "$in Spotify Adblock. Done"

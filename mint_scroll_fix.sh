#!/bin/bash

sudo apt install imwheel zenity -y
mkdir ~/.local/bin
wget http://www.nicknorton.net/mousewheel.sh -O ./mousewheel.sh
chmod 755 ./mousewheel.sh
cp ./mousewheel.sh ~/.local/bin/mousewheel.sh
chmod u+x ~/.local/bin/mousewheel.sh
echo -e "[Desktop Entry]\nName=Mouse Wheel Adjustment\nExec=mousewheel.sh\nComment=\nTerminal=false\nIcon=mouse\nType=Application" > $(xdg-user-dir DESKTOP)/mousewheel.desktop
chmod u+x $(xdg-user-dir DESKTOP)/mousewheel.desktop
echo -e "[Desktop Entry]\nName=imwheel\nExec=imwheel\nX-GNOME-Autostart-enabled=true\nNoDisplay=false\nHidden=false\nComment=Activates wheel scroll speed fix on system startup\nX-GNOME-Autostart-Delay=0\nType=Application" > ~/.config/autostart/imwheel.desktop
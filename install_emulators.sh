#!/bin/bash
#Var list
in="Installing"
stR="Setting up Repo for"
remo="Removing"

#Start
echo "Script for installing various console emulators."
echo "Targeted for Linux Mint 20.x & Mint 21.x"

echo "Check for Updates, Install Updates, and Remove unneeded"
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "$in Emulators"

## Nintendo Systems
#NES
##echo "$in Fceux (NES)"
##sudo apt install fceux

echo "$in Nestopia (NES)"
##flatpak
flatpak install ca._0ldsk00l.Nestopia
flatpak override --user --filesystem=home ca._0ldsk00l.Nestopia

##APT (deb)
#sudo apt install nestopia


#SNES
##echo "$in bsnes (SNES)"
##flatpak install dev.bsnes.bsnes

echo "$in Snes9x (SNES)"
flatpak install com.snes9x.Snes9x
flatpak override --user --filesystem=home com.snes9x.Snes9x

#GameBoy & GameBoy Color
echo "$in GB Enhanced+ (GB, GBC, GBA)"
flatpak install com.github.shonumi.gbe-plus
flatpak override --user --filesystem=home com.github.shonumi.gbe-plus


#N64
#echo "$in m64p (N64)"
#io.github.m64p.m64p

#echo "$in Parallel Launcher (N64)"
#ca.parallel_launcher.ParallelLauncher


#GameBoy Advance
echo "$in mGBA (GBA)"
##flatpak
#flatpak install io.mgba.mGBA

##APT (deb)
#QT UI
sudo apt install mgba-qt  mgba-common

#SDL UI
#sudo apt install mgba-sdl mgba-common


#DS
#echo "$in DeSmuME (DS)"
##flatpak
#org.desmume.DeSmuME

##APT (deb)
#sudo apt-get install desmume


echo "$in melonDS (DS)"
flatpak install net.kuribo64.melonDS
flatpak override --user --filesystem=home net.kuribo64.melonDS


##Gamecube & Wii

#echo "$in Dolphin (Gamecube & Wii)"

##flatpak
#flatpak install org.DolphinEmu.dolphin-emu

##APT (deb)
#echo "$tR Dophin Emulator (Stable)"
#sudo apt-add-repository ppa:dolphin-emu/ppa -y
#sudo apt install dolphin-emu

#echo "$tR Dophin Emulator (Development Version)"
#sudo apt-add-repository ppa:dolphin-emu/ppa -y
#sudo apt install dolphin-emu-master



#3ds
### Citra and Yuzu are dead
##echo "$in Cirtra Nightly (3DS)"
##flatpak install org.citra_emu.citra

echo "$in Lime3DS (3DS)"
flatpak install io.github.lime3ds.Lime3DS


#Switch
##echo "$in Ryujinx (Switch)"
##flatpak install org.ryujinx.Ryujinx

#echo "$in Yuzu (Switch)"
#flatpak install org.yuzu_emu.yuzu



## Sony systems (needs bios)
#PS1
#echo "$in DuckStation (PS1)"
#flatpak install org.duckstation.DuckStation

#echo "$in PCSX/PCSXR (PS1)"
#sudo apt install pcsxr

#PS2
#echo "$in PCSX2 (PS2)"
#flatpak install net.pcsx2.PCSX2

#echo "$in PCSX2 (PS2)"
#sudo apt install pcsx2:i386


#PSP
#echo "$in PPSSPP (PSP)"
#flatpak install org.ppsspp.PPSSPP


#PS3
#echo "$in RPCS3 (PS3)"
#flatpak install net.rpcs3.RPCS3



##Multiple systems
##echo "$in Higan (multiple systems)"
##sudo apt install higan


#echo "$in Mednaffe (Mednafen front end) (multiple systems)"
##flatpak
#flatpak install com.github.AmatCoder.mednaffe

##APT (deb)
#sudo apt install mednaffe


#echo "$in RetroArch (multiple systems)"
#flatpak install org.libretro.RetroArch



echo "--------------------------------------------------------------------------------"
echo " "
echo "--------------------------------------------------------------------------------"

echo "DONE!"
#End

#Notes
#For now all flatpaks
#Check for native apt (deb) versions in repos

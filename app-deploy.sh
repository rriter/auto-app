#!/bin/bash

####################################
## Application auto deploy script ##
## Written by: Rodney Riter       ##
## Date: April 3, 2019            ##
## Version: 1.0			  ##
## Last Update: April 4, 2019     ##
####################################

# Check if sudo is installed

command -v sudo > /dev/null || {
  echo "This script requires sudo.  Please install sudo."
  exit 1
}

# Ensure system is up to date

clear
echo "Ensuring system is up to date with apt update & apt upgrade"
echo ""
sleep 3s
sudo apt update && sudo apt upgrade -y
echo ""
echo ""
echo "System is now up to date"
echo ""
sleep 3s

# Install some programs from the standard repo

clear
sudo apt install nfs-common gimp neofetch ffmpeg gdebi gdebi-core htop deluge gnome-tweaks filezilla -y
echo ""
echo ""
echo ""
echo "nfs-common, gimp, neofetch, ffmpeg, gdebi gdebi-core, deluge, gnome tweaks, filezilla & htop"
sleep 5s

# Install some programs from their own repos (adding their repos in the process)

# OBS Studio
clear
echo "adding obs repo"
sleep 1s
sudo add-apt-repository -y ppa:obsproject/obs-studio
echo "installing obs"
sleep 2s
sudo apt update && apt install obs-studio -y
echo ""
echo ""
echo "OBS installed"
sleep 5s

# Grub Customizer
clear
echo "adding repo for grub customizer"
sleep 2s
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
echo "installing grub customizer"
sudo apt update && sudo apt install grub-customizer -y
echo ""
echo ""
echo "Grub Customizer Installed"
sleep 5s

# Time Shift
clear
echo "adding repo for Time Shift"
sleep 2s
sudo apt-add-repository -y ppa:teejee2008/ppa
echo "installing Time SHift"
sudo apt update && sudo apt install timeshift -y
echo ""
echo ""
echo "Time Shift Installed"
sleep 5s

# Download & install software via .deb files from the softwares website
# Check if wget is installed and install if not
clear
echo "Download & install .deb software"
echo ""
sleep 3s
command -v wget > /dev/null || {
  command -v apt-get > /dev/null && sudo apt-get install wget
}

cd ~/Downloads

# Angry IP Scanner
clear
echo "installing Angry IP Scanner"
echo ""
sleep 2s
wget https://github.com/angryip/ipscan/releases/download/3.5.5/ipscan_3.5.5_amd64.deb
sudo dpkg -i ipscan_3.5.5_amd64.deb
sudo apt -f install -y
echo ""
echo ""
echo "Angry IP Scanner Installed"
sleep 5s

# Team Viewer
clear
echo "Installing Team Viewer"
echo ""
sleep 2s
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer_amd64.deb
sudo apt -f install -y
echo ""
echo ""
echo "Team Viewer Installed"
sleep 5s

# Install Snap Packages

# VLC
clear
echo "Installing VLC"
sudo snap install vlc
echo ""
echo ""
echo "VLC Installed"
sleep 5s

# FileBot
clear
echo "Installing FileBot"
sudo snap install filebot
sudo snap connect filebot:removable-media
echo ""
echo ""
echo "FileBot Installed"
sleep 5s


#!/usr/bin/env bash   
#Minimal_Dev_Workstaion.sh
######################################################################################################################
################################################## INTRODUCTION ######################################################
######################################################################################################################
echo "Base System for Minimal Fedora Dev Workstaion Install" 
echo "Created By Amourdux [xubdux]"
######################################################################################################################
######################################## UPDATES, SYSTEM PREP ########################################################
######################################################################################################################
sudo dnf group update "core" -y 
sudo dnf install neofetch git figlet cowsay fish -y 
sudo dnf install dnf-utils dnf-plugins-core htop gparted -y 
sudo dnf install thunar alacritty ark gcc -y

echo "######################################################################################################################"
                                    figlet "rpmfusion free & non free Repository"
echo "######################################################################################################################"
NAME=home/user
TRUE=Y
FALSE=N


echo "Add RPM Fusion Repos" | cowsay 
#Promt 1
#read -p "This will add the RPM Fusion Free Repository, Do you want to Install? (y/n) " -r REPLY
#if [$REPLY =~ ^[Nn]$ ];then
    #echo "Exiting..."
    #exit 1
#fi [ $REPLY =~ ^[Yy]$ ];then
    #echo "Adding To System..."
#RPM-Fusion free repo 
sudo dnf -y install \https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
#Promt 2
#read -p "This will add the RPM Fusion Non-free Repository, Do you want to Install? (y/n) " -r REPLY
#if [ $REPLY =~ ^[Nn]$ ]; then
    #echo "Exiting..."
    #exit 1
#fi [ $REPLY =~ ^[Yy]$ ]; then
    #echo "Adding To System..."
#RPM-Fusion non-free repo 
sudo dnf -y install \https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sleep 2
figlet "Repos Have Been Added!"
######################################################################################################################

NAME=home/user
echo "###################################################################################################"
                                     echo "(Optional)"
                                     figlet "Enabling COPR Repositories"
                                     echo "(Optional)"
                                     figlet "Install Custom Kernel"
echo "###################################################################################################"
#Promt-copr
#read -p "This will add the COPR-Fedora Repository, Do you want to Install? (y/n) " -r REPLY
#if  $REPLY =~ ^Nn$ ; then
    #echo "Exiting..."
    #exit 1
#fi  $REPLY =~ ^Yy$ ; then
    figlet "Adding To System..."
sudo dnf install copr-cli -y
sudo dnf copr enable @neurofedora/neurofedora-extra
#Promt-Xanmod
#read -p "This will add the kernel-xanmod-edge, With functionality to improve performence, operate in #realtime and have low latency! Do you want to Install? (y/n) " -r REPLY
#if [ $REPLY =~ ^[Nn]$ ]; then
    #echo "Exiting..."
    #exit 1
#fi [ $REPLY =~ ^[Yy]$ ]; then
    figlet "Adding To System..."
# back up
#sudo cp /etc/fstab /etc/fstab.orig
#sudo dnf copr enable rmnscnce/kernel-xanmod -y
#sudo dnf install kernel-xanmod-edge kernel-xanmod-rt kernel-xanmod-tt -y
#cat /proc/version
#echo "Removing unneeded kernel modules"
#modules="module1 module2 module3"

#for module in $modules; 
#do modprobe -r $module


############################################################################################################
                                  figlet "Display/Login Manager and bareboned Desktop Componets" 
###########################################################################################################
#X11-System
sudo dnf install xorg-x11-server-Xorg xorg-x11-drivers -y  
sudo dnf install gdm.x86_64 gdm-devel.x86_64 -y
sudo systemctl enable gdm.x86_64 -y
sudo systemctl set-default graphical.target -y
sudo dnf install picom nitrogen rofi cairo-dock polybar -y
sudo dnf install openbox.x86_64 openbox-theme-mistral-thin-dark openbox-devel.x86_64 -y
sudo dnf install openbox-libs.x86_64 obconf.x86_64 obconf-qt.x86_64 -y 
sudo dnf install xmonad awesome -y
sudo dnf group install "Window Managers" -y


echo "###################################################################################################"
                                           figlet "Group Installs" 
echo "###################################################################################################"
######### Minimal-Desktop-Environment#########
sudo dnf group install "Administration Tools" "System Tools" "Sound and Video" -y
#sudo dnf group install "C Development Tools and Libraries" "Development Tools" "RPM Development Tools" -y
sleep 3  
#sudo dnf group install"Cloud Infrastructure" "Cloud Management Tools" "Container Management" -y 
#sudo dnf group install"Security Lab" "virtualization -y 
#sudo systemctl start libvertd
#sudo systemctl enable libvertd


#sudo dnf install rofi-wayland.x86_64 -y  ####Fork of rofi with Wayland suppor #lavalauncher.x86_64 ####lavalauncher is a simple launcher for Wayland

sudo dnf distro-sync
sudo dnf clean all
sudo dnf update 
echo "###################################################################################################"
                                figlet "Ready To Reboot!"
echo "###################################################################################################"
neofetch
<EOF>
Done!

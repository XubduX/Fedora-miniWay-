#!/usr/bin/env bash   Minimal_Dev_Workstaion.sh
######################################################################################################################
################################################## INTRODUCTION ######################################################
######################################################################################################################
echo Base System for Minimal Fedora Dev Workstaion Install 
echo Created By Amourdux [xubdux]
######################################################################################################################
######################################## UPDATES, SYSTEM PREP ########################################################
######################################################################################################################
sudo dnf update && sudo dnf upgrade -y
sudo dnf install neofetch git figlet cowsay fish -y 
sudo dnf install dnf-utils dnf-plugins-core htop gparted
sudo dnf install thunar alacritty ark gcc -y

######################################################################################################################
                                    figlet "rpmfusion free & non free Repository"
######################################################################################################################
NAME=home/user
TRUE=Y
FALSE=N

sudo dnf  group update "core" -y  
sleep 1
echo "Add RPM Fusion Repos" | cowsay 
#Promt 1
read -p "This will add the RPM Fusion Free Repository, Do you want to Install? (y/n) " -r REPLY
if [[ $REPLY =~ ^[Nn]$ ]];then
    echo "Exiting..."
    exit 1
fi [[ $REPLY =~ ^[Yy]$ ]];then
    echo "Adding To System..."
#RPM-Fusion free repo 
sudo dnf -y install \https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
#Promt 2
read -p "This will add the RPM Fusion Non-free Repository, Do you want to Install? (y/n) " -r REPLY
if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "Exiting..."
    exit 1
fi [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Adding To System..."
#RPM-Fusion non-free repo 
sudo dnf -y install \https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sleep 2
figlet Repos Have Been Added!
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
    echo "Adding To System..."
sudo dnf install copr-cli -y
sudo dnf copr enable @neurofedora/neurofedora-extra
#Promt-Xanmod
#read -p "This will add the kernel-xanmod-edge, With functionality to improve performence, operate in #realtime and have low latency! Do you want to Install? (y/n) " -r REPLY
#if [[ $REPLY =~ ^[Nn]$ ]]; then
    #echo "Exiting..."
    #exit 1
#fi [[ $REPLY =~ ^[Yy]$ ]]; then
   # echo "Adding To System..."
sudo cp /etc/fstab /etc/fstab.orig
sudo dnf copr enable rmnscnce/kernel-xanmod -y
sudo dnf install kernel-xanmod-edge kernel-xanmod-rt kernel-xanmod-tt -y
cat /proc/version
#echo "Removing unneeded kernel modules"
#modules="module1 module2 module3"

#for module in $modules; 
#do modprobe -r $module

echo "Unbind Bluetooth"
echo -n "2-1.6" > /sys/bus/usb/drivers/usb/unbind

echo "Disable CPU frequency scaling"
systemctl mask ondemand

"echo Set scaling governor to performance"
echo -n performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo "Maximum realtime priority"
@audio - rtprio 90
echo "Maximum locked-in-memory address space (KB)"
@audio - memlock unlimited

cd /etc/sysctl.conf
vm.swappiness = 10

figlet "Grabbing TT-CPU-Scheduler from github"
sudo mkdir github

cd github

sudo git clone https://github.com/hamadmarri/TT-CPU-Scheduler.git
sudo chmod 755 TT-CPU-Scheduler.git
sudo ./ttdebug.sh | grep -i realtime
cd ~

echo "Check Config with scan tool"

su -c 'yum install mercurial'
#hg clone https://realtimeconfigquickscan.googlecode.com/hg/ realtimeconfigquickscan

#cd realtimeconfigquickscan/

#perl realTimeConfigQuickScan.pl
############################################################################################################
                                  #figlet "Display/Login Manager and bareboned Desktop Componets" 
###########################################################################################################
#X11-System
#sudo dnf install xorg-x11-server-Xorg xorg-x11-drivers -y  
#sudo dnf install gdm.x86_64 gdm-devel.x86_64 : Development files for gdm -y
#sudo systemctl enable gdm.x86_64 -y
#sudo systemctl set-default graphical.target -y
#sudo dnf install picom nitrogen rofi cairo-dock polybar -y
#sudo dnf install openbox.x86_64 openbox-theme-mistral-thin-dark openbox-devel.x86_64 -y
#sudo dnf install openbox-libs.x86_64 obconf.x86_64 obconf-qt.x86_64 -y 
#sudo dnf group install "Window Managers" -y


echo "###################################################################################################"
                                           figlet "Group Installs" 
echo "###################################################################################################"
######### Minimal-Desktop-Environment#########
sudo dnf group install "Administration Tools" "System Tools" "Sound and Video" -y
sudo dnf group install "C Development Tools and Libraries" "Development Tools" "RPM Development Tools" -y
sleep 3  
sudo dnf group install"Cloud Infrastructure" "Cloud Management Tools" "Container Management" -y 
sudo dnf group install"Security Lab"  -y 

echo "###################################################################################################"
                                figlet "Wayland protocols & Desktop Programs"
echo "###################################################################################################"
sudo dnf install wlroots.x86_64 wayland-utils.x86_64 xorg-x11-server-Xwayland.x86_64 -y
#Rust-wayland-protocols -y
sudo dnf install libwayland-server.x86_64  libwayland-cursor.x86_64  libwayland-client.x86_64 -y
#Dynamic display configuration for Wayland# #Command-line copy/paste utilities for Wayland# #Simple Wayland output mirror client#
sudo dnf install kanshi.x86_64 wl-clipboard.x86_64 wl-mirror.x86_64 -y
#Image viewer for X11 and Wayland# #Fast, lightweight and minimalistic Wayland terminal emulator# #Application launcher for wlroots based Wayland compositors#
sudo dnf install imv.x86_64 foot.x86_64 fuzzel.x86_64 -y
  #Wayland client side decoration library#Lightweight Wayland notification daemon#Protocol files for the river wayland compositor
sudo dnf install libdecor.x86_64 mako.x86_64 river-protocols-devel.x86_64 -y
#Wallpaper tool for Wayland compositors#An idle daemon for wayland compositors#Screen locker for Wayland
sudo dnf install swaybg.x86_64 swayidle.x86_64 swaylock.x86_64 -y
#Desktop-dedicated wayland bar for wayfire and other wlroots based compositors#Highly customizable Wayland bar for Sway and Wlroots based compositors #Wayland forwarding proxy#A VNC server for wlroots based Wayland compositors
sudo dnf install wapanel.x86_64 waybar.x86_64 waypipe.x86_64 wayvnc.x86_64 -y
#Reference compositor for Wayland#A tool for debugging events on a sway Wayland window#Set contrast, brightness and gamma for wayland compositors#A launcher/menu for wlroots based wayland compositors
sudo dnf install weston.x86_64 wev.x86_64 wl-gammactl.x86_64 wofi.x86_64 -y
#sudo dnf install
#$sudo dnf install rofi-wayland.x86_64 -y  ####Fork of rofi with Wayland suppor #lavalauncher.x86_64 ####lavalauncher is a simple launcher for Wayland

echo "###################################################################################################"
                      figlet "Wayland Compositors and Window managers"
echo "###################################################################################################"
sudo dnf install hikari.x86_64 -y #Stacking Wayland compositor with tiling capabilities
sudo dnf install labwc.x86_64 -y  #Openbox alternative for Wayland
sudo dnf install river.x86_64 -y #Dynamic tiling Wayland compositor
sudo dnf install wayfire.x86_64 -y #3D wayland compositor

echo "###################################################################################################"
                                        figlet "KDE FRAMEWORKS"
echo "###################################################################################################"
#KDE Frameworks 5 library that wraps Client and Server Wayland libraries
#Development files for kf5-kwayland
# Provides integration plugins for various KDE Frameworks for Wayland
#Wayland server components built on KDE Frameworks
sudo dnf install kf5-kwayland.x86_64 Kf5-kwayland-devel.x86_64 kwayland-integration.x86_64 kwayland-server.x86_64 -y

echo "###################################################################################################"
                                    figlet "Cutefish-Desktop"
echo "###################################################################################################"
sudo dnf copr enable rmnscnce/cutefish-desktop
#sudo dnf install cutefish-desktop
sudo dnf install cutefish-core.x86_64 --skip-broken cutefish-desktop-common --skip-broken -y
sudo dnf install cutefish-dock.x86_64-skip-broken -y
sudo dnf install cutefish-filemanager.x86_64 cutefish-icons.x86_64 cutefish-launcher.x86_64 -y
sudo dnf install cutefish-settings.x86_64 cutefish-statusbar.x86_64 cutefish-terminal.x86_64 -y
sudo dnf install libcutefish.x86_64 fishui.x86_64 -y 


echo "###################################################################################################"
                                figlet "Ready To Reboot!"
echo "###################################################################################################"
neofetch
<EOF>
Done!
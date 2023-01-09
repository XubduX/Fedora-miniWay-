#!/usr/bin/env bash 
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

###########################################



#Original file
##################################
#Promt-copr
read -p "This will add the COPR-Fedora Repository, Do you want to Install? (y/n) " -r REPLY
if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "Exiting..."
    exit 1
fi [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Adding To System..."
sudo dnf install copr-cli -y
sudo dnf copr enable @neurofedora/neurofedora-extra
#Promt-Xanmod
read -p "This will add the kernel-xanmod-edge, With functionality to improve performence, operate in realtime and have low latency! Do you want to Install? (y/n) " -r REPLY
if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "Exiting..."
    exit 1
fi [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Adding To System..."
sudo cp /etc/fstab /etc/fstab.orig
sudo dnf copr enable rmnscnce/kernel-xanmod -y
sudo dnf install kernel-xanmod-edge kernel-xanmod-rt kernel-xanmod-tt -y
cat /proc/version
echo "Removing unneeded kernel modules"
modules="module1 module2 module3"

for module in $modules; do
  modprobe -r $module

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

#figlet "Grabbing TT-CPU-Scheduler from github"
#sudo mkdir github

#cd github

sudo git clone https://github.com/hamadmarri/TT-CPU-Scheduler.git
sudo chmod 755 TT-CPU-Scheduler.git
#sudo ./ttdebug.sh | grep -i realtime
#cd ~

#echo "Check Config with scan tool"

#su -c 'yum install mercurial'
#hg clone https://realtimeconfigquickscan.googlecode.com/hg/ realtimeconfigquickscan

#cd realtimeconfigquickscan/

#perl realTimeConfigQuickScan.pl
#!/usr/bin/env bash
figlet "Wayland protocols & Desktop Programs"
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
<EOF>
Done!
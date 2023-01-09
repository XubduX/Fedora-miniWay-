#!/usr/bin/env bash 
figlet "Wayland Compositors and Window managers"
sudo dnf install hikari.x86_64 -y #Stacking Wayland compositor with tiling capabilities
sudo dnf install labwc.x86_64 -y  #Openbox alternative for Wayland
sudo dnf install river.x86_64 -y #Dynamic tiling Wayland compositor
sudo dnf install wayfire.x86_64 -y #3D wayland compositor


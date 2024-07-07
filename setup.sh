#!/bin/bash


echo "====================> faster boot"
rc-update del networking boot
mkdir /etc/runlevels/async
rc-update add -s default async
printf "::once:/sbin/openrc async" >> /etc/inittab
rc-update add networking async

ALPUSER="lhl"
ALPNAME="lhl"

echo "========== Alpine Linux Setup  ================"

echo "====================> Create new user"
adduser -g "$ALPNAME" $ALPUSER

echo "====================> Add user $ALPUSER to proper groups"
adduser $ALPUSER wheel
adduser $ALPUSER input
adduser $ALPUSER video
adduser $ALPUSER audio

echo "====================> Add Community remos and update system"
# add comunity packages and update system
echo "http://dl-cdn.alpinelinux.org/alpine/v3.20/community" >> /etc/apk/repositories
apk update
apk upgrade



echo "====================> Installing helpful packages"
#apk add dbus xdg-desktop-portal xdg-desktop-portal-wlr linux-firmware wireless-tools iwd util-linux
#apk add pciutils usbutils coreutils binutils findutils grep iproute2 
#apk add alsa-utils alsa-utils-doc alsa-lib alsaconf alsa-ucm-conf 
#apk add bluez mako 
#apk add python3 network-manager-applet kanshi clipman gnome-tweaks gnome-keyring micro vim font-misc-misc ttf-font-awesome
#apk add terminus-font ttf-inconsolata
#apk add curl zsh light gawk grim slurp feh
#apk add bash bash-doc bash-completion
#apk add udisks2 udisks2-doc

echo "====================> Installing CPU drivers"
#apk add mesa-dri-gallium		#necessary intel graphics driver
#apk add mesa-va-gallium		#mesa vapi driver for video devoding acelleration
#apk add intel-media-driver		#vapi driver video decoding acelleration for cpu after 2014
#apk add libva-intel-driver		#vapi driver video decoding acelleration for cpu bevor 2014
#apl add linux-firmware-i915	#if dmesg complains abaut firmware missing

echo "====================> Installing necesarry system packages"
# setup xorg necesary
setup-xorg-base
#eudev Device manager, bettersuited for dektop usecase also remove mdev less suited Device manager
apk add eudev
setup-devd udev
# adds intel wireless demon for doing wifi stuff
apk add iwd
# adds dbus cmmunication tool used by applications to interact coordinate and communicate with each other
apk add dbus dbus-x11
# seated is to manage/allow the use of system recources for packages
apk add seatd

echo "====================> Installing audio driver"
#apk add pipewire wireplumber pipewire-alsa
#cp -a /usr/share/pipewire /etc
#cp -a /usr/share/wireplumber /etc


echo "====================> Installing packages to make sway a viable desktop"
apk add nwg-launchers-bar
apk add waybar
apk add sway sway-doc xwayland
apk add swaylock swaylockd swaybg swayidle
#apk add elogind polkit-elogind autotiling 

echo "====================> Installing applications"
# adds apps: Terminal; app launcher; file browser; internet browser; git; texteditor; screenshot tool
apk add alacritty wofi thunar firefox git neovim grim doas
#compilers and stuff
apk add g++
#apk add build-base

echo "====================> Installing icons and fonts"
apk add font-nerd-fonts-symbols
apk add ttf-dejavu

echo "====================> deleting packages which have been replaced"
apk del mdev
apk del vim


echo "====================> Update main config files"
mkdir /home/$ALPUSER/.config/
#mkdir /home/$ALPUSER/.profile
cp -r configs/* /home/$ALPUSER/.config/
cp -r mimeapps.list /etc/xdg/
cat .profile >> /home/$ALPUSER/.profile
cd /home/$ALPUSER/.config
git clone https://github.com/LigoliPuschkin/nvim
#setsup britness contross so script can do work
touch /etc/udev/rules.d/backlight.rules
RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"

#flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#flatpak repair

echo "====================> Include default wallpaper"
cp -r wallpaper /home/$ALPUSER/

echo "====================> Configuring services to launch at boot"
# rc-update: 	add or remove OpenRC services to and from runlecels
#				services that run on start up or special runlevels
# rc-service: used to start and stop services stop and start
rc-update add seatd
rc-service seatd start
adduser $ALPUSER seat
rc-service dbus start
rc-update add dbus
rc-service iwd start
rc-update add iwd
#export $(dbus-launch)
#/usr/libexec/pipewire-launcher
#rc-service alsa start
#rc-update add alsa


#echo "====================>  audio management [y/N]"
#read instrep
#if [[ $instrep == "y" ]]; then
#	apk add pipewire wireplumber pipewire-alsa
	
#	cp -a /usr/share/pipewire /etc
#	cp -a /usr/share/wireplumber /etc

#fi

echo "====================>  chg doas.conf and XDG_RUNTIME"
# no longer needed since we coppy .profile from githup
#printf 	'if [ -z "$XDG_RUNTIME_DIR" ]; then \n	XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir" \n \n mkdir -pm 0700 "$XDG_RUNTIME_DIR" \n export XDG_RUNTIME_DIR \n fi\n' > /home/$ALPUSER/.profile
echo "permit persist :wheel" >> /etc/doas.conf


#echo "setup flathub [y/N]"
#read instrep
#if [[ $instrep == "y" ]]; then 
#	apk add flatpak
#	flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	
#	echo "install flthub packages: FreeCAD [y/N]"
	#read instrep 
	#if [[ $instrep == "y" ]]; then
		#flatpak --user install freecad
		#echo "to run flatpak: flatpak run app-ID:"
		#echo "to list flatpaks: flatpak list"
		#flatpak list				#schows app id
	#flatoak run app-ID
 	#fi
 	
#fi

echo "====================>  make user owner of his directory; and disale root"
chown -R $ALPUSER /home/$ALPUSER
#locks root user out cant use root any more?	
#passwd -l root	
echo "====================>  Setup complete"
echo "You can now reboot your machine."

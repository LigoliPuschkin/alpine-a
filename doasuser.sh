#!/bin/bash
# sets up britness controll so script can do work
doas touch /etc/udev/rules.d/backlight.rules
doas RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
doas RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"

doas apk install flatpak
doas flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# if necesary:
#flatpak repair

# add VM https://wiki.alpinelinux.org/wiki/KVM
#doas apk add libvirt-daemon
# allowes the use of different os formats
#doas apk qemu-img 
# to emulate x86_64 system
#doas apk qemu-system-x86_64
# not necesary
#doas apk qemu-modules

#doas apk openrc
#rc-update add libvirtd
#modprobe tun
#echo "tun" >> /etc/modules-load.d/tun.conf
#cat /etc/modules | grep tun || echo tun >> /etc/modules
#addgroup user libvirt
# probably not necesary
#apk add dbus polkit virt-manager font-terminus
#rc-update add dbus

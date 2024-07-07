#!/bin/bash
#sets up britness controll so script can do work
doas touch /etc/udev/rules.d/backlight.rules
doas RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
doas RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"

doas apk install flatpak
doas flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# if necesary:
#flatpak repair

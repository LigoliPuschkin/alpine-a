#!/bin/bash
#
net=/etc/init.d/networking
NEt=/etc/runlevels/async
echo "====================> faster boot"
rc-update del networking boot
mkdir $NEt
rc-update add -s default async
printf "::once:/sbin/openrc async" >> /etc/inittab
rc-update add networking async

if test -f "$net"; then
  if test -f "$NEt/networking"; then
    rm $NEt/networking
  fi
  cp $net $NEt 
fi

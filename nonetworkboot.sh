#!/bin/bash
#
net=/etc/init.d/networking
NEt=/etc/runlevels/async
NET=/etc/runlevels/async/networking
echo "====================> faster boot"
rc-update del networking boot
mkdir $NEt
rc-update add -s default async
printf "::once:/sbin/openrc async" >> /etc/inittab
rc-update add networking async

if test -f "$net"; then
  if test -f "$NET"; then
    rm $NET
  fi
  cp $net $NEt
  rm $net
fi

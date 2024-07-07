#!/bin/bash
#
net=/etc/init.d/networking

echo "====================> faster boot"
rc-update del networking boot
mkdir /etc/runlevels/async
rc-update add -s default async
printf "::once:/sbin/openrc async" >> /etc/inittab
rc-update add networking async

if test -f "$net"; then
  rm $net
fi

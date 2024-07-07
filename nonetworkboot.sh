#!/bin/bash

echo "====================> faster boot"
apk add git
rc-update del networking boot
mkdir /etc/runlevels/async
rc-update add -s default async
printf "::once:/sbin/openrc async" >> /etc/inittab
rc-update add networking async

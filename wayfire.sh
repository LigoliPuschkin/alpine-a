sed -i -e "s/#http.*/v3.16/community$/http://eu.edge.kernel.org/alpine/v3.16/community/g" /etc/apk/repositories
apk update
apk add git meson py3-pip wayland-dev autoconf libtool libffi-dev libxml2-dev gegl-dev libinput-dev libxkbcommon-dev pixman-dev xcb-proto cairo-dev glm-dev jpeg-dev gtkmm3-dev xwayland libdrm-dev pulseaudio-dev libpciaccess-dev g++ eudev-dev libseat-dev libevdev-dev gobject-introspection-dev alsa-utils alsa-utils-doc alsa-lib alsaconf alsa-ucm-conf alsa-lib-dev vim dust ttf-dejavu mingetty mesa-dri-gallium seatd eudev dbus dbus-openrc
rc-update add seatd
rc-update add dbus default
setup-devd udev

cd /opt/
git clone https://github.com/WayfireWM/wf-install
cd wf-install/
sed -i -e 's/--backup=t//g' install.sh
./install.sh --prefix /opt/wayfire --stream master
apk del gcc g++

adduser wayfire
adduser wayfire input
adduser wayfire video
adduser wayfire seat
adduser wayfire audio

sed -i -e 's/^tty1.$/tty1::respawn:/sbin/mingetty tty1 --autologin wayfire/g' /etc/inittab
sed -i -e 's/^ttyS0.$/#ttyS0::respawn:/sbin/getty -L 0 ttyS0 vt100/g' /etc/inittab

cat >> /home/wayfire/.profile2 <<EOF
if test -z "${XDG_RUNTIME_DIR}"; then
export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
if ! test -d "${XDG_RUNTIME_DIR}"; then
mkdir "${XDG_RUNTIME_DIR}"
chmod 0700 "${XDG_RUNTIME_DIR}"
fi
fi
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
/opt/wayfire/bin/startwayfire
fi

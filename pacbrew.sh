#!/bin/bash

# vars
PACBREW=/opt/pacbrew

# deps
sudo apt update
sudo apt install -y build-essential pkg-config automake autoconf cmake meson ninja-build gettext texinfo libssl-dev libarchive-tools libarchive-dev libcurl4-openssl-dev libgpgme-dev

# pacbrew build
rm -rf build
meson --prefix=$PACBREW/pacman --sysconfdir=$PACBREW/pacman/etc --localstatedir=$PACBREW/pacman/var -Dpkg-ext=.pkg.tar.xz -Dmakepkg-template-dir=$PACBREW/usr/share/makepkg-template build/
ninja -C build/
sudo ninja -C build/ install

# pacbrew links
sudo cp pacbrew/bin/* /usr/bin/


#!/bin/bash

# vars
PACBREW=/opt/pacbrew

# deps
sudo apt install -y meson ninja-build gettext libarchive-dev libcurl4-openssl-dev libgpgme-dev

# pacbrew build
rm -rf build
meson --prefix=$PACBREW/pacman --sysconfdir=$PACBREW/pacman/etc --localstatedir=$PACBREW/pacman/var -Dmakepkg-template-dir=$PACBREW/usr/share/makepkg-template build/
ninja -C build/
ninja -C build/ install

# pacbrew links
sudo cp pacbrew/bin/* /usr/bin/


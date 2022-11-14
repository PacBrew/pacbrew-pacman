#!/bin/bash

# vars
PACBREW=/opt/pacbrew

# deps
sudo apt update
sudo apt install -y build-essential pkg-config meson ninja-build \
  gettext libarchive-dev libssl-dev libcurl4-openssl-dev libgpgme-dev

# pacbrew build
meson --prefix=$PACBREW/pacman --sysconfdir=$PACBREW/pacman/etc --localstatedir=$PACBREW/pacman/var \
  -Dpkg-ext=.pkg.tar.xz -Dmakepkg-template-dir=$PACBREW/pacman/share/makepkg-template build
ninja -C build
DESTDIR=$PWD/pacbrew ninja -C build install

# pacbrew deb
rm -rf pacbrew/usr/share
dpkg-deb --build pacbrew
mv pacbrew.deb pacbrew-pacman-1.1.deb

# cleanup
rm -rf build pacbrew/opt


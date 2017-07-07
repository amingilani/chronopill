#!/bin/bash

wget http://prdownloads.sourceforge.net/netatalk/netatalk-3.1.10.tar.gz
tar -xf netatalk-3.1.10.tar.gz
cd netatalk-3.1.10 || exit
./configure \
        --with-init-style=debian-systemd \
        --without-libevent \
        --without-tdb \
        --with-cracklib \
        --enable-krbV-uam \
        --with-pam-confdir=/etc/pam.d \
        --with-dbus-daemon=/usr/bin/dbus-daemon \
        --with-dbus-sysconf-dir=/etc/dbus-1/system.d \
        --with-tracker-pkgconfig-version=1.0

make
sudo make install

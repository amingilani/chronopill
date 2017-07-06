#!/bin/bash

sudo apt-get install hfsprogs hfsplus

sudo apt-get install \
  build-essential \
  libevent-dev \
  libssl-dev \
  libgcrypt11-dev \
  libkrb5-dev \
  libpam0g-dev \
  libwrap0-dev \
  libdb-dev \
  libtdb-dev \
  libmysqlclient-dev \
  avahi-daemon \
  libavahi-client-dev \
  libacl1-dev \
  libldap2-dev \
  libcrack2-dev \
  systemtap-sdt-dev \
  libdbus-1-dev \
  libdbus-glib-1-dev \
  libglib2.0-dev \
  libio-socket-inet6-perl \
  tracker \
  libtracker-sparql-1.0-dev \
  libtracker-miner-1.0-dev

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

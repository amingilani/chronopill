#!/bin/bash

apt-get update && apt-get upgrade -y

sudo apt-get install -y \
  hfsprogs \
  hfsplus \
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

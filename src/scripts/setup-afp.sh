#!/bin/bash

# setup configuration
sed -i '/^hosts:/ s/$/ mdns4 mdns/' /etc/nsswitch.conf
cp /src/afpd.service /etc/avahi/services/afpd.service
cp /src/afp.conf /usr/local/etc/afp.conf

# add new user
useradd ${USERNAME:-'tmuser'}
echo ${USERNAME:-'tmuser'}:${PASSWORD:-'password'} | chpasswd
sed -i "/^  valid users =/ s/$/ ${USERNAME:-tmuser}/" /usr/local/etc/afp.conf

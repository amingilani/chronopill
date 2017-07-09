#!/bin/bash

# setup configuration
sed -i '/^hosts:/ s/$/ mdns4 mdns/' /etc/nsswitch.conf
cp /src/afpd.service /etc/avahi/services/afpd.service
cp /src/afp.conf /usr/local/etc/afp.conf

# add new user
useradd ${USERNAME:-'tmuser'}
echo ${USERNAME:-'tmuser'}:${PASSWORD:-'password'} | chpasswd
sed -i "/^  valid users =/ s/$/ ${USERNAME:-tmuser}/" /usr/local/etc/afp.conf


# create the mount directory
mkdir -p /media/tm
chown -R ${USERNAME:-'tmuser'} /media/tm
# add fstab entry
echo "/dev/sda2 /media/tm hfsplus force,rw,user,auto 0 0" >> /etc/fstab
# mount it all
mount -a

# start services
service dbus start
service avahi-daemon start
service netatalk start

# persist service on startup (not that resin needs this)
systemctl enable avahi-daemon
systemctl enable netatalk

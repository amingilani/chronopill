#!/bin/bash

# create the mount directory
mkdir -p /media/tm
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

#!/bin/bash

# create the mount directory
sudo mkdir -p /media/tm
# add fstab entry
echo "/dev/sda2 /media/tm hfsplus force,rw,user,auto 0 0" >> /etc/fstab
# mount it all
mount -a

# start services
service avahi-daemon start
service netatalk start
systemctl enable avahi-daemon
systemctl enable netatalk

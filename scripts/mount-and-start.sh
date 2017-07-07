#!/bin/bash

# create the mount directory
mkdir -p /media/tm
# add fstab entry
echo "/dev/sda2 /media/tm hfsplus force,rw,user,auto 0 0" >> /etc/fstab
# mount it all
mount -a

systemctl enable avahi-daemon
systemctl enable netatalk


# start services
service dbus start
service avahi-daemon start
netatalk start

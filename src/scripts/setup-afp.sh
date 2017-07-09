#!/bin/bash

sed -i '/^hosts:/ s/$/ mdns4 mdns/' /etc/nsswitch.conf
cp ../afpd.service /etc/avahi/services/afpd.service
cp ../afp.conf /usr/local/etc/afp.conf

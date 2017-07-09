#!/bin/bash

sed -i '/^hosts:/ s/$/ mdns4 mdns/' /etc/nsswitch.conf
cp /src/afpd.service /etc/avahi/services/afpd.service
cp /src/afp.conf /usr/local/etc/afp.conf

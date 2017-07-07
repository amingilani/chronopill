#!/bin/bash

# add mdns4 and mdns services
sed -i '/^hosts:/ s/$/ mdns4 mdns/' /etc/nsswitch.conf

# configure avahi service
cat <<EOT >> /etc/avahi/services/afpd.service
line 1
line 2
<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
    <name replace-wildcards="yes">%h</name>
    <service>
        <type>_afpovertcp._tcp</type>
        <port>548</port>
    </service>
    <service>
        <type>_device-info._tcp</type>
        <port>0</port>
        <txt-record>model=TimeCapsule</txt-record>
    </service>
</service-group>
EOT

# setup TimeCapsule mimicry
cat <<EOT >> /usr/local/etc/afp.conf
[Global]
  mimic model = TimeCapsule6,106

[Time Machine]
  path = /media/tm
  time machine = yes
EOT

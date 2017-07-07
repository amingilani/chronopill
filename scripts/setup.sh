#!/bin/bash

sed -i '/^hosts:/ s/$/ mdns4 mdns/' /etc/nsswitch.conf

cat <<EOT >> /etc/avahi/services/afpd.service
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

cat <<EOT >> /usr/local/etc/afp.conf
    [Global]
      mimic model = TimeCapsule6,106

    [Time Machine]
      path = /media/tm
      time machine = yes
EOT

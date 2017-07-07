FROM resin/raspberrypi3-debian:jessie

COPY scripts /scripts

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
      avahi-daemon \
      build-essential \
      hfsplus \
      hfsprogs \
      libevent-dev \
      libssl-dev \
      libgcrypt11-dev \
      libkrb5-dev \
      libpam0g-dev \
      libwrap0-dev \
      libdb-dev \
      libtdb-dev \
      libmysqlclient-dev \
      libavahi-client-dev \
      libacl1-dev \
      libldap2-dev \
      libcrack2-dev \
      libdbus-1-dev \
      libdbus-glib-1-dev \
      libglib2.0-dev \
      libio-socket-inet6-perl \
      libtracker-sparql-1.0-dev \
      libtracker-miner-1.0-dev \
      systemtap-sdt-dev \
      tracker \
      wget

RUN wget http://prdownloads.sourceforge.net/netatalk/netatalk-3.1.10.tar.gz && \
    tar -xf netatalk-3.1.10.tar.gz && \
    cd netatalk-3.1.10 && \
    ./configure \
            --with-init-style=debian-systemd \
            --without-libevent \
            --without-tdb \
            --with-cracklib \
            --enable-krbV-uam \
            --with-pam-confdir=/etc/pam.d \
            --with-dbus-daemon=/usr/bin/dbus-daemon \
            --with-dbus-sysconf-dir=/etc/dbus-1/system.d \
            --with-tracker-pkgconfig-version=1.0 && \
    make && \
    make install


RUN sed -i '/^hosts:/ s/$/ mdns4 mdns/' /etc/nsswitch.conf

RUN cat <<EOT >> /etc/avahi/services/afpd.service
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

RUN cat <<EOT >> /usr/local/etc/afp.conf
    [Global]
      mimic model = TimeCapsule6,106

    [Time Machine]
      path = /media/tm
      time machine = yes
EOT


ENTRYPOINT ["/bin/bash", "/scripts/mount-and-start.sh"]

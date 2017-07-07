FROM resin/raspberrypi3-debian:jessie

COPY scripts /scripts

RUN ["/bin/bash", "/scripts/setup.sh"]
RUN ["/bin/bash", "/scripts/install-netatalk.sh"]
RUN ["/bin/bash", "/scripts/configure-netatalk.sh"]

CMD ["/bin/bash", "/scripts/mount-and-start.sh"]

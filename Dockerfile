FROM resin/raspberrypi3-debian:jessie

# Update
RUN apt-get update && apt-get upgrade -y

COPY scripts /scripts

RUN ["/bin/bash", "/scripts/setup.sh"]

CMD ['netatalk', '-V']

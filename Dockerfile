FROM tobi312/rpi-php
MAINTAINER lucidnonsense

# set version label
ARG BUILD_DATE
ARG VERSION
ARG HTTPPORT=5666
ARG HTTPSPORT=5667
ARG FASTCGIPORT=9000
ARG PORTS='$HTTPPORT:$HTTPSPORT:$FASTCGIPORT'

LABEL build_version="lucidnonsense version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# add local files, set custom NGINX directory
COPY root /

RUN sudo apk update
RUN sudo apk --no-cache add gettext iptables
RUN sudo envsubst "$PORTS" < /etc/templates/default > /defaults/default
RUN sudo chmod 777 /defaults/default
    
# ports and volumes
VOLUME /config





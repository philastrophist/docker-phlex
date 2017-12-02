FROM lsioarmhf/nginx-armhf
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

RUN apk update
RUN apk --no-cache add gettext iptables
RUN envsubst "$PORTS" < /etc/templates/default > /defaults/default
RUN chmod 777 /defaults/default

# ports and volumes
VOLUME /config





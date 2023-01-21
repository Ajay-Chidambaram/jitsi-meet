ARG JITSI_REPO=jitsi
ARG BASE_TAG=latest
FROM ${JITSI_REPO}/base:${BASE_TAG}

LABEL org.opencontainers.image.title="Jitsi Meet"
LABEL org.opencontainers.image.description="WebRTC compatible JavaScript application that uses Jitsi Videobridge to provide high quality, scalable video conferences."
LABEL org.opencontainers.image.url="https://jitsi.org/jitsi-meet/"
LABEL org.opencontainers.image.source="https://github.com/jitsi/docker-jitsi-meet"
LABEL org.opencontainers.image.documentation="https://jitsi.github.io/handbook/"

ADD https://raw.githubusercontent.com/acmesh-official/acme.sh/2.8.8/acme.sh /opt
COPY rootfs/ /


RUN apt-dpkg-wrap apt-get update && \
      apt-dpkg-wrap apt-get install -y cron nginx-extras socat curl jq && \
      rm -f /etc/nginx/conf.d/default.conf && \
      apt-cleanup


ARG DEBIAN_FRONTEND=noninteractive
ARG PACK_NAME=jitsi-meet-web_1.0.1-1_all.deb
COPY ./${PACK_NAME} /
COPY ./script.sh /

RUN apt-get -y update \
      && apt-get -y install zstd \
      && apt-get -y install xz-utils 


# RUN apt upgrade dpkg/jammy-updates
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN chmod +x /script.sh && ./script.sh

RUN apt-get -y install --no-install-recommends /${PACK_NAME} 

# mv /usr/share/jitsi-meet/interface_config.js /defaults && \

EXPOSE 80 443

VOLUME ["/config", "/usr/share/jitsi-meet/transcripts"]
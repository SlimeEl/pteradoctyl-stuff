# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:3-alpine

LABEL       author="Michael Parker" maintainer="docker@parkervcp.com"

RUN         apk add --no-cache --update git \
            imagemagick build-base python-dev py-pip jpeg-dev zlib-dev \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
ENV LIBRARY_PATH=/lib:/usr/lib

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]

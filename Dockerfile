# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:3-alpine

LABEL       author="Michael Parker" maintainer="docker@parkervcp.com"

RUN         set -eux; \
			apk add --no-cache --update git \
				imagemagick build-base python python-dev py-pip zlib-dev \
				build-base \
				openjdk8-jre \
				unzip \
				freetype-dev \
				libpng-dev \
				jpeg-dev \
				libxml2-dev \
				libxslt-dev \
				imagemagick \
				imagemagick-dev \
				ffmpeg \
				ffmpeg-dev \
				py3-pillow \
			; \
	    adduser -D -h /home/container container;

USER        container
ENV         USER=container HOME=/home/container
ENV         LIBRARY_PATH=/lib:/usr/lib

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]

# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:3.7.3-alpine3.9

LABEL       author="Michael Parker" maintainer="docker@parkervcp.com"

RUN set -eux; \
        apk add --no-cache \
# Redbot dependencies
        build-base \
        git \
        unzip \
# Popular cog dependencies (python)
    # matplotlib
        freetype-dev \
        libpng-dev \
    # pillow
        jpeg-dev \
    # lxml
        libxml2-dev \
        libxslt-dev \
    # numpy
        libc6-compat \
# Popular cog dependencies (programs)
        imagemagick \
        imagemagick-dev \
        ffmpeg \
        ffmpeg-dev \
	openssh-client \
	linux-headers \
	libffi-dev \
	openssl-dev \
    ; \
	    adduser -D -h /home/container container;

USER        container
ENV         USER=container HOME=/home/container
ENV         LIBRARY_PATH=/lib:/usr/lib

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]

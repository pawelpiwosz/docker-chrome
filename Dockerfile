FROM alpine:latest

LABEL maintainer="Pawel Piwosz <devops@pawelpiwosz.net>"

# For Travis build
ARG BUILD_DATE
ARG VCS_REF
ARG VER

LABEL \
  org.label-schema.schema-version="1.0" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/pawelpiwosz/docker-chrome" \
  org.label-schema.name="docker-chrome" \
  org.label-schema.description="Dockerized Chrome" \
  org.label-schema.version=$VER

RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk add --no-cache \
      dbus \
      nss@edge \
      freetype@edge \
      ttf-freefont@edge \
      chromium@edge \
      chromium-chromedriver@edge \
      libcanberra-gtk3 \
      libpng

RUN export LD_LIBRARY_PATH="/usr/bin/chromium-browser"
RUN dbus-uuidgen --ensure && dbus-uuidgen --ensure=/etc/machine-id

RUN mkdir -p /usr/src/app \
    && adduser -D chrome \
    && chown -R chrome:chrome /usr/src/app
# Run Chrome as non-privileged
USER chrome
WORKDIR /usr/src/app

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Autorun chrome headless with no GPU
ENTRYPOINT ["chromium-browser", "--disable-gpu", "--disable-software-rasterizer"]

## Dockerized Chrome

Docker container for Chrome. The version of the browser is the current one when
container was build.

#### Test status

[![Build Status](https://travis-ci.org/pawelpiwosz/docker-chrome.svg?branch=master)](https://travis-ci.org/pawelpiwosz/docker-chrome)
[![](https://images.microbadger.com/badges/image/almerhor/chrome.svg)](https://microbadger.com/images/almerhor/chrome "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/almerhor/chrome.svg)](https://microbadger.com/images/almerhor/chrome "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/almerhor/chrome.svg)](https://microbadger.com/images/almerhor/chrome "Get your own commit badge on microbadger.com")

### Synopsis

Sometimes it is worth to use the web browser in isolated environment. This
container contains chromium browser, for more safe surfing.

### To do

This image has some errors still. I hope I'll be able to solve them.

### Pull image

In order to pull image from dockerhub registry, run:

```
docker pull almerhor/chrome
```

### Build
bra
In order to build the image, run:

```
docker build -t chrome .
```

### Run

In order to run chrome container, execute:

```
docker run -it --rm --name chrome \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix\
  -e DISPLAY=$DISPLAY \
  --security-opt seccomp=$(pwd)/chrome.json \
  chrome
```

In order to check the Chrome version, run:

```
docker run -it --rm --name chrome \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix\
  -e DISPLAY=$DISPLAY \
  --security-opt seccomp=$(pwd)/chrome.json \
  --entrypoint "chromium-browser" \
  chrome --version
```

### Memory reservation

This contaier can be run with restricted memory size. In order to do it, add
`-m=1G` to docker run command. In this case, memory will be limited to 1G.

### Credits

I wrote this container based on [Marco](https://github.com/mmatoscom/) work.  
Also, I used a tips described in [this repo](https://github.com/Zenika/alpine-chrome).
Many thanks for great job to [Jessfraz](https://github.com/jessfraz/dockerfiles).

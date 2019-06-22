## Dockerized Firefox

Docker container for Firefox. The version is last one when container
was build.

#### Test status

[![Build Status](https://travis-ci.org/pawelpiwosz/docker-firefox.svg?branch=master)](https://travis-ci.org/pawelpiwosz/docker-firefox)
[![](https://images.microbadger.com/badges/image/almerhor/firefox.svg)](https://microbadger.com/images/almerhor/firefox "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/almerhor/firefox.svg)](https://microbadger.com/images/almerhor/firefox "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/almerhor/firefox.svg)](https://microbadger.com/images/almerhor/firefox "Get your own commit badge on microbadger.com")

### Synopsis

Sometimes it is worth to use the web browser in isolated environment

### Pull image

In order to pull image from dockerhub registry, run:

```
docker pull almerhor/firefox
```

### Build

In order to build the image, run:

```
docker build -t firefox .
```

### Run

In order to run firefox container, execute:

```
docker run -it --rm --name firefox \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix\
  -e DISPLAY=$DISPLAY \
  firefox
```

In order to run in private mode:

```
docker run -it --rm --name firefox \
  -v /dev/shm:/dev/shm \
  -v /tmp/.X11-unix:/tmp/.X11-unix\
  -e DISPLAY=$DISPLAY \
  firefox --private-window
```

### Memory reservation

This contaier can be run with restricted memory size. In order to do it, add
`-m=1G` to docker run command. In this case, memory will be limited to 1G.

### Credits

I wrote this container based on [Marco](https://github.com/mmatoscom/) work.

# kali-on-macos
A cleaned-up version from my [Running Kali under Docker with X11 Forwarding on Mac OS X](https://medium.com/@fat_zombi/running-kali-under-docker-with-x11-forwarding-on-mac-os-x-17fabfc1dd2) article.

While [Homebrew](https://brew.sh) contains a lot of the packages I use for security testing, I wanted to see if I could replace OffSec's Kali VM for PWK with my own linux distribution running in Docker under my macbook. 

## Repo contents
- **.env**: The environment file that contains values used by our other files.
- **Dockerfile**: This file defines the image which includes all of the dependencies and initial configuration we want included in our base image.
- **docker-compose.yml**: This file performs a build of the image and creates a running container.
- **Makefile**: Because I'm lazy, I just want to type `make` and have it start and configure XQuartz (for x11 forwarding) and start my container and put me directly into a shell.

## Requirements
- Install and configure [XQuartz](https://www.xquartz.org) on mac OS.
- Install and configure [Docker Desktop](https://www.docker.com/products/docker-desktop/) on mac OS.

## Install/Setup/Run
1. Edit the `.env` file.
2. Copy any files/directories into the `data` directory that you want brought into your home folder.
3. `docker-compose up -d`
4. `make`

If you make subsequent changes to the `Dockerfile`, we can issue `docker-compose up -d --build` so that it makes use of the other cached layers, rather than doing a full rebuild with `--no-cache`.
#!/usr/bin/env bash
#
# Install Ubuntu dependencies as root

quiet(){ "$@" >/dev/null 2>&1; }

info(){ echo "OpenCV install: $*"; }

become_root() {
  if ! [ $EUID -eq 0 ]
  then
    exec sudo /bin/bash "$0" "$@"
  fi
}

case $OSTYPE in
  darwin*|win*)
    ;;
  linux*)
    info "installing OpenCV required dependencies"
    become_root
    apt install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y
    ;;
esac

